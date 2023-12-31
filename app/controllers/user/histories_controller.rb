class User::HistoriesController < User::Base
  skip_before_action :verify_authenticity_token
  def index
    @histories = current_user.histories
    @histories = @histories.includes(:video, video: :channel)
    @histories = @histories.order(id: "DESC")
    @histories = @histories.page(params[:page]).per(20)
    @histories = @histories.map {|history| {
      'title'=> history.video.title,
      'id'=> history.id,
      'video_id'=> history.video.id,
      'youtube_id'=> history.video.youtube_id,
      'channel_name'=> history.video.channel_name,
      'channel_id'=> history.video.channel_id,
      'total_seconds'=> history.video.total_seconds,
      'published_at'=> history.video.published_at,
    }}
    #raise RuntimeError
    respond_to do |format|
      format.html
      format.json { render json: @histories.to_json }
    end
  end

  def search
    word = params[:word]
    @videos = Video.includes(:channel)
    @videos = @videos.where("title LIKE ?", "%#{word}%")
    @videos = @videos.order(published_at: :DESC)
    @histories = History.where(video_id: @videos.pluck(:id), user: current_user)
    @histories = @histories.includes(:video, video: :channel)
    @histories = @histories.page(params[:page]).per(20)
    @histories = @histories.map {|history| {
      'title'=> history.video.title,
      'id'=> history.id,
      'video_id'=> history.video.id,
      'youtube_id'=> history.video.youtube_id,
      'channel_name'=> history.video.channel_name,
      'channel_id'=> history.video.channel_id,
      'total_seconds'=> history.video.total_seconds,
      'published_at'=> history.video.published_at,
    }}
    respond_to do |format|
      format.html
      format.json { render json: @histories.to_json }
    end
  end

  def create
    @video = Video.find_by(youtube_id: params[:youtube_id])
    @history = current_user.histories.build(video: @video)
    @history.save!
  end

  def create_multiple
    youtube_ids = params[:youtube_ids]
    history_params = youtube_ids.map{|id|{
      user_id: current_user.id,
      youtube_id: id
    }}
    render json: History.create!(history_params)
  end

  def delete_multiple
    ids = params[:ids]
    render json: History.destroy(ids)
  end
  
  def destroy
    @history = History.find_by(id: params[:id])
    render json: @history.destroy!
  end

  def delete_all
    @histories = current_user.histories
    render json: @histories.destroy_all
  end

  private
  def history_params
    params.require(:history).permit(:attribute_to_update)
  end
end
