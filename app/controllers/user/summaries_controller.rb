class User::SummariesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    summaries = Summary.where(
      user: User.find_by(uuid: params[:uuid]),
      video: Video.find_by(youtube_id: params[:youtube_id])
    )
    params = summaries.map do |summary| 
      summary.result_param
    end
    respond_to do |format|
      format.html
      format.json { render json: {'summaries' => params}.to_json }
    end
  end
  
  def create
    summary = Summary.new
    begin
      client = Gemini.new(
        credentials: {
          service: 'generative-language-api',
          api_key: ENV['GEMINI_PASSWORD']
        },
        options: { model: 'gemini-pro', server_sent_events: true }
      )
      summary = Summary.create(summary_params)

      uri = URI.parse("https://#{ENV['LAMBDA_DOMAIN']}.lambda-url.ap-northeast-1.on.aws/?youtube_id=#{summary.youtube_id}&mode=slice")
      response = Net::HTTP.get_response(uri)
      text = JSON.parse(response.body)
      subtitles = text['subtitles']

      new_subtitles = []
      subtitles.each_with_index do |subtitle, index|
        new_subtitles.push('<ok>')
        new_subtitles.push(subtitle)
      end
      new_subtitles.unshift(
        "これから長文を入力します。内容は『#{summary.video.title}』についてです。
        これから入力するので、#{summary.order}
        返事は<ok>と返してください。
        \nただし<end>というまで要約しないでください。
        <end>と言ったら<ok>なしで実行してください"
        )
      new_subtitles.push('<ok>')
      new_subtitles.push('<end>')
      conversation = new_subtitles.map.with_index{
        |s,i| { role: ['user','model'][i%2], parts: { text: new_subtitles[i] } }
      }

      response = client.stream_generate_content({
        contents: conversation
      })
      finish_reasons = response.map{|r| r['candidates'][0]["finishReason"] }
      non_stop_reason = finish_reasons.find { |reason| reason != "STOP" }
      if non_stop_reason.present?
        summary.update(
          question: conversation, 
          answer: summary.answer
        )
        raise StandardError.new(non_stop_reason)
      end
      summary.answer = response.map{|r| r['candidates'][0]['content']['parts'][0]["text"] }.join
      summary.update(
        question: conversation, 
        answer: summary.answer,
        summarized_at: DateTime.now
      )
    rescue => e
      ErrorLog.create(
        error_class: e.class,
        error_message: e.message,
        error_backtrace: e.backtrace,
        request_method: request.method,
        request_controller: controller_name, 
        request_action: action_name, 
        request_id_number: params[:id], 
        request_parameter: params, 
      )
      if e.to_s == "SAFETY"
        summary.answer = "性的、暴力的、または差別的な表現が含まれているとAIが判断したため生成に失敗しました。"
      else
        summary.answer = e
      end
    end
    respond_to do |format|
      format.html
      format.json {
        render json: summary.result_param.to_json, 
        status: summary.is_success ? :created : :internal_server_error 
      }
    end
  end

  def summary_params
    params.require(:summary).permit(
      :uuid, 
      :order,
      :youtube_id
      )
  end
end
