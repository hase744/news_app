class User::CategoriesController < User::Base
  skip_before_action :verify_authenticity_token
  def show
    category = Category.find_by(
      user: params[:id]
    )
    respond_to do |format|
      format.html
      format.json { render json: category.channels.to_json }
    end
  end
  
  def index
    categories = current_user.categories
    respond_to do |format|
      format.html
      format.json { render json: categories.to_json }
    end
  end

  def channels
    category = Category.find_by(
      name: params[:name]
    )
    respond_to do |format|
      format.html
      format.json { render json: category.channels.map{|c| c.output_hash} }
    end
  end

  def create
    @category = Category.find_by(name: category_params[:name])
    if @category.present?
      update
      puts "あり"
      return
    else
      puts "なし"
    end
    user = current_user
    youtube_ids = params[:youtube_ids]
    channels = Channel.where(youtube_id: youtube_ids)
    if user.present? && youtube_ids.length == channels.length
      ActiveRecord::Base.transaction do
        category = Category.create(
          category_params.merge(
            user: user, 
            start_at: DateTime.now
            )
          )
        channels.each do |channel|
          ChannelCategory.create(
            channel_id: channel.id, 
            category_id: category.id,
            is_absolute: true
          )
        end
      end
    end
  end

  def destroy
    user = current_user
    category = Category.find_by(
      name: params[:category][:name], 
      user: user
      )
    category.destroy!
  end

  def update
    user = current_user
    youtube_ids = params[:youtube_ids]
    channels = Channel.where(youtube_id: youtube_ids)
    deleting_youtube_ids = @category.channels.pluck(:youtube_id) - youtube_ids
    new_youtube_ids = youtube_ids - @category.channels.pluck(:youtube_id)
    if user.present? && youtube_ids.length == channels.length
      ActiveRecord::Base.transaction do
        @category.update(category_params)
        Channel.where(youtube_id: new_youtube_ids).each do |channel|
          ChannelCategory.create!(
            channel_id: channel.id, 
            category_id: @category.id,
            is_absolute: true
          )
        end
        channels = Channel.find_by(youtube_id: deleting_youtube_ids)
        ChannelCategory.where(channel: channels, category_id: @category.id).each do |channel_category|
          channel_category.destroy
        end
      end
    end
  end

  private
  def category_params
    params.require(:category).permit(
      :japanese_name,
      :name,
      :emoji,
      :is_formal,
      :image_url,
      )
  end
end
