class VideosController < ApplicationController
  def show
    word = params[:word]
    @videos = Video.includes(:channel)
    @videos = @videos.where("title LIKE ?", "%#{word}%")
    @videos = @videos.page(20).page(params[:page])
    @videos = @videos.map {|video| {
      'title'=> video.title,
      'id'=> video.id,
      'youtube_id'=> video.youtube_id,
      'channel_name'=> video.channel_name,
      'channel_id'=> video.channel_id,
      'total_seconds'=> video.total_seconds,
      'published_at'=> video.published_at,
    }}
    respond_to do |format|
      format.html
      format.json { render json: @videos.to_json }
    end
  end
end
