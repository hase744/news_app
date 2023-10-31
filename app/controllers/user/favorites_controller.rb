class User::FavoritesController < User::Base
  skip_before_action :verify_authenticity_token
  def index
    @favorites = current_user.favorites
    @favorites = @favorites.includes(:video, video: :channel)
    @favorites = @favorites.order(id: "DESC")
    @favorites = @favorites.page(params[:page])
    @favorites = @favorites.map {|favorite| {
      'title'=> favorite.video.title,
      'id'=> favorite.id,
      'video_id'=> favorite.video.id,
      'youtube_id'=> favorite.video.youtube_id,
      'channel_name'=> favorite.video.channel_name,
      'channel_id'=> favorite.video.channel_id,
      'total_seconds'=> favorite.video.total_seconds,
      'published_at'=> favorite.video.published_at,
    }}
    #raise RuntimeError
    respond_to do |format|
      format.html
      format.json { render json: @favorites.to_json }
    end
  end

  def search
    word = params[:word]
    @videos = Video.includes(:channel)
    @videos = @videos.where("title LIKE ?", "%#{word}%")
    @favorites = Favorite.where(video_id: @videos.pluck(:id), user: current_user)
    @favorites = @favorites.includes(:video, video: :channel)
    @favorites = @favorites.page(params[:page]).per(20)
    @favorites = @favorites.map {|favorite| {
      'title'=> favorite.video.title,
      'id'=> favorite.id,
      'video_id'=> favorite.video.id,
      'youtube_id'=> favorite.video.youtube_id,
      'channel_name'=> favorite.video.channel_name,
      'channel_id'=> favorite.video.channel_id,
      'total_seconds'=> favorite.video.total_seconds,
      'published_at'=> favorite.video.published_at,
    }}
    respond_to do |format|
      format.html
      format.json { render json: @favorites.to_json }
    end
  end

  def create
    @video = Video.find(params[:video_id])
    @favorite = current_user.favorites.build(video: @video)
    @favorite.save!
  end

  def create_multiple
    video_ids = params[:video_ids]
    favorite_params = video_ids.map{|id|{
      user_id: current_user.id,
      video_id: id
    }}
    render json: Favorite.create!(favorite_params)
  end

  def delete_multiple
    ids = params[:ids]
    render json: Favorite.destroy(ids)
  end
  
  def destroy
    @favorite = Favorite.find_by(id: params[:id])
    render json: @favorite.destroy!
  end

  def delete_all
    @favorites = current_user.favorites
    render json: @favorites.destroy_all
  end

  private
  def favorite_params
    params.require(:favorite).permit(:attribute_to_update)
  end
end
