class PressCreator
    LENGTH = 3.days
    SPAN = 6.hours
    def create_news
        Category.where.not(start_at: nil).all.each do |category|
            puts "#{category.name}関連"
            news = []
            youtube_ids = []
            days_ago = [0,1,2]
            (LENGTH/SPAN).times.each do |time|
                bundle = bundled_videos({"category"=>category, "before"=>time*SPAN})
                news.concat(bundle.map { |video| video.savind_hash })
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
        before = parameter["before"]
        beginning_time = DateTime.now - before - SPAN
        ending_time = DateTime.now - before
        puts "#{beginning_time} ~ #{ending_time}のニュースを作成"
        press_section = category.videos.where(is_live:false).includes(:channel).where(published_at: beginning_time..ending_time).order(total_views: :DESC)
        press_section
    end
end