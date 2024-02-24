class User::SummariesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    summaries = Summary.where(
        user: User.find_by(uuid: params[:uuid]),
        video: Video.find_by(youtube_id: params[:youtube_id])
    )
    params = summaries.map do |summary| 
        {
        'order' => summary&.order,
        'answer' => summary&.answer,
        }
    end
    respond_to do |format|
      format.html
      format.json { render json: {'summaries' => params}.to_json }
    end
  end
  
  def create
    client = Gemini.new(
      credentials: {
        service: 'generative-language-api',
        api_key: ENV['GEMINI_PASSWORD']
      },
      options: { model: 'gemini-pro', server_sent_events: true }
    )
    youtube_id = params[:summary][:youtube_id]
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
      "これから長文を入力するので、
      #{summary.order}
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
    result = nil
    begin
        result = response.map{|r| r['candidates'][0]['content']['parts'][0]["text"] }.join
    rescue => e
        result = [e]
    end
    summary.update(
        question: conversation, 
        answer: result,
        summarized_at: DateTime.now
    )
    respond_to do |format|
      format.html
      format.json { render json: {'summary' => result}.to_json }
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
