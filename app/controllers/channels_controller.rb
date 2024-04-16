class ChannelsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    begin
      channel = Channel.find_by(youtube_id: params[:url].split('/').last)
      channel = Channel.find_by(url: params[:url]) if channel.nil?
      channel = Channel.create!(url: params[:url]) if channel.nil?
      render json: { channel: channel.output_hash, is_success: true }
    rescue => e
      puts e
      if e.to_s == 'Validation failed: Youtube has already been taken'
        render json: { message: "Channel already exists", channel: channel.output_hash, is_success: true }, status: :no_content
      else
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end
  end

  def search
    word = params[:word]
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = ENV['YOUTUBE_KEY2']
    
    search_response = youtube.list_searches('snippet', q: word, type: 'channel', max_results: 50, region_code: 'JP')
    
    channels = search_response.items.map do |search_result|
      {
        'name':search_result.snippet.title,
        'image_url':search_result.snippet.thumbnails.default.url,
        'youtube_id':search_result.snippet.channel_id
      }
    end
    respond_to do |format|
      format.html
      format.json { render json: channels.to_json }
    end
  end
end
