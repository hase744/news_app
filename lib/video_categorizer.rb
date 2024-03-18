require_relative 'video_category_collection.rb'
class VideoCategorizer
  def bundle_enum
    #[{"category":"world", "words":["アメリカ","中国"]}]のようなパラメーターを作る
    @category_words_params = Parallel.map(Category.where.not(start_at: nil)) do |category|
      category.name_words_param
    end
  end

  def categorize_videos(videos)
    #[{"video_id" => 1, "category_id" => 1, 'words' => "単語"}]のような配列
    @video_category_params = Parallel.map(videos, in_threads: 1) do |video|
      video.channel.channel_categories.map do |channel_category|
        category = channel_category.category
        category_words_param = @category_words_params.find { |hash| 
          hash["category"] == category.name 
        }
        words = video.included_words(category_words_param["words"])
        channel_category.categorized_video_category_param(words, video)
      end.compact
    end.flatten

    VideoCategory.upsert_all(@video_category_params) if videos.present?

    Video
      .where(id: videos.map {|video| video.id })
      .update_all(categorized_at: DateTime.now)
  end

  def categorize
    bundle_enum
    videos = Video.where(categorized_at: nil)
    categorize_videos(videos)
  end

  def categorize_in_slice
    bundle_enum
    @videos = Video.where(categorized_at: nil)
    @videos.each_slice(1000) do |videos|
      categorize_videos(videos)
    end
  end
end