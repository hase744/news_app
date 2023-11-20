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
        #    Enumeration.where(category:category).each do |wl|
        #        words_array = wl.words.split(',')
        #        param["words"] = param["words"].concat words_array
        #    end
        #    @category_words_params.push(param)
        #end

        @category_words_params = Parallel.map(Category.where.not(start_at: nil)) do |category|
            param = {}
            param[category.name] = []
            category.enumerations.each do |enum|
                words_array = enum.words.split(',')
                param[category.name] = param[category.name].concat words_array
            end
            @category_words_param[category.name] = param[category.name]
            param
        end

        @category_words_params.each do |param|
            @category_words_param[param.keys[0]] = param.values[0]
        end
        puts @category_words_params

        videos = Video.where(categorized_at: nil)
        puts "ビデオ数"
        puts videos.count
        @video_category_params = Parallel.map(videos) do |video|
            params = []
            categories = video.channel.categories
            categories.each do |category|
                #param = @category_words_params[category.name]
                channel_category = ChannelCategory.find_by(channel:video.channel, category:category)
                if channel_category.is_absolute
                    params.push({"video_id"=>video.id,"category_id"=>category.id, 'words'=>nil})
                    #puts "#{video.title}を#{category.name}にカテゴライズ"
                else
                    hash = nil
                    words = []
                    @category_words_param[category.name].each do |word|
                        if video.title.index(word) != nil
                            hash = {"video_id"=>video.id,"category_id"=>category.id}
                            #params.push({"video_id"=>video.id,"category_id"=>category.id, 'word'=>word})
                            words.push(word)
                            puts "#{video.title}を#{category.name}にカテゴライズ"
                        end
                    end 
                    if hash.present?
                        hash['words'] = words.join(',')
                        params.push(hash)
                    end
                end
            end
            params
        end
        @video_category_params = @video_category_params.flatten

        if videos.present?
            puts "ある"
            @video_category_collection = VideoCategoryCollection.new(@video_category_params)
            @video_category_collection.save
        end

        videos.update_all(categorized_at: DateTime.now)
    end
end