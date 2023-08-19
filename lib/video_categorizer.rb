require_relative 'video_category_collection.rb'
class VideoCategorizer
    CHANNEL_CATEGORY_PARAMS = []
    def categorize
        @video_category_params = []
        @category_words_params = []
        #[{"category":"world", "words":["アメリカ","中国"]}]のようなパラメーターを作る
        @category_words_param = {}
        @video_categorr_absolute_param = {}
        #{"world":["アメリカ","中国"}のようなパラメーターを作る
        #Category.all.each do |category|
        #    param = {}
        #    param["category_name"] = category.name
        #    param["words"] = []
        #    WordList.where(category:category).each do |wl|
        #        words_array = wl.words.split(',')
        #        param["words"] = param["words"].concat words_array
        #    end
        #    @category_words_params.push(param)
        #end

        Parallel.each(Category.all) do |category|
            param = {}
            param["words"] = []
            WordList.where(category:category).each do |wl|
                words_array = wl.words.split(',')
                param["words"] = param["words"].concat words_array
            end
            @category_words_param[category.name] = param["words"]
        end

        videos = Video.where(categorized_at: nil)
        Parallel.each(videos) do |video|
            categories = video.channel.categories
            categories.each do |category|
                #param = @category_words_params[category.name]
                channel_category = ChannelCategory.find_by(channel:video.channel, category:category)
                if channel_category.is_absolute
                    @video_category_params.push({"video_id"=>video.id,"category_id"=>category.id})
                    puts "#{video.title}を#{category.name}にカテゴライズ"
                else
                    @category_words_param[category.name].each do |word|
                        if video.title.index(word) != nil
                            @video_category_params.push({"video_id"=>video.id,"category_id"=>category.id})
                            puts "#{video.title}を#{category.name}にカテゴライズ"
                            break;
                        end
                    end 
                end
            end
            video.update(categorized_at: DateTime.now)
        end

        if videos.present?
            puts "ある"
            @video_category_collection = VideoCategoryCollection.new(@video_category_params)
            @video_category_collection.save
        end

    end
end