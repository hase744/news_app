class User::PressesController < User::Base
  def index
    @categories = Category.general(current_user.id)
    #@categories = @categories.includes(:presses)
    #なぜか上を追加すると本番環境で処理が遅くなってタイムアウトになる
    #↓[[1,2][2,3]]のような配列を生成
    last_presses = Press
      .group(:category_id)
      .having('MAX(id) = MAX(id)')
      .pluck(:category_id, Arel.sql('MAX(id)'))
      
    category_id_and_news = Category
      .joins(:presses)
      .where('presses.id IN (?)', last_presses.map(&:last))
      .pluck(:id, 'presses.news_json')

    original_category_ids = Category.original(current_user).pluck(:id)

    #category_video_id = VideoCategory
    #  .joins(:video)
    #  .where(category_id: original_category_ids)
    #  .where(video: {published_at: (DateTime.now.-3.day)..DateTime.now})
    #  .pluck(:category_id, :video_id)

    #videos = Video.where(id: category_video_id.map {|cv_id| cv_id[1]})
    #puts videos.count
    #videos_hash = videos.map{|v| {
    #  hash: v.savind_hash, 
    #  category_id: category_video_id.find{|cv| cv[1] == v.id}[1]
    #  }}

    #Video.where(category_id: original_category_ids)
    categories_param = @categories.includes(:child_categories).map do |category|
      if category.user_id.present?
        category.emoji ||= ''
        videos = category.videos
          .includes(:channel)
          .where(is_live:false)
          .limit(20)
          .order(published_at: :desc)
        next if videos.length == 0
        press = videos.map { |video| video.savind_hash }
      else
        press = category_id_and_news.find { |item| item[0] == category.id }[1]
      end
      category.output_hash(press)
    end.compact
    respond_to do |format|
      format.html
      format.json { render json: categories_param.to_json }
    end
  end
end
