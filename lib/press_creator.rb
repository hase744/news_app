class PressCreator
    def create_news
        Category.where.not(start_at: nil).all.each do |category|
            puts "#{category.name}関連"
            news = []
            youtube_ids = []
            days_ago = [0,1,2]
            days_ago.each do |day|
                bundle = bundled_videos({"category"=>category, "day_ago"=>day})
                news.concat(bundle.map { |video| video.hash })
                youtube_ids.push(bundle.pluck(:youtube_id).as_json)
            end
            Press.create(category:category,youtube_ids: youtube_ids.join(","), news_json:news.to_json)
            #puts news
            #puts category.name
            #puts youtube_ids
        end
    end

    def bundled_videos(parameter)
        category = parameter["category"]
        day_ago = parameter["day_ago"]
        beginning_time = DateTime.now - day_ago - 1
        ending_time = DateTime.now - day_ago
        puts "#{beginning_time} ~ #{ending_time}のニュースを作成"
        press_section = category.videos.where(is_live:false).includes(:channel).where(published_at: beginning_time..ending_time).order(total_views: :DESC)
        press_section
    end
end