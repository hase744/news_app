require_relative 'video_category_collection.rb'
class VideoCategorizer
    CHANNEL_CATEGORY_PARAMS = []
    def bundle_enum
        @video_category_params = []
        @category_words_params = []
        #[{"category":"world", "words":["アメリカ","中国"]}]のようなパラメーターを作る
        @category_words_param = {}
        @video_categorr_absolute_param = {}
        #{"world":["アメリカ","中国"}のようなパラメーターを作る

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
    end

    def categorize_videos(videos)
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
                        end
                    end 
                    puts "#{video.title}を#{category.name}にカテゴライズ" if words.present?
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
            #@video_category_collection = VideoCategoryCollection.new(@video_category_params)
            #@video_category_collection.save
            VideoCategory.upsert_all(
                @video_category_params.map{|video|{
                    video_id:video['video_id'],
                    category_id:video['category_id'],
                    words:video['words'],
                }}
            )
        end

        Video
          .where(id: videos.map {|video| video.id })
          .update_all(categorized_at: DateTime.now)
    end

    def categorize
        bundle_enum
        @category_words_params.each do |param|
            @category_words_param[param.keys[0]] = param.values[0]
        end
        puts @category_words_params

        videos = Video.where(categorized_at: nil)
        puts "ビデオ数"
        puts videos.count
        categorize_videos(videos)
    end


    def categorize_in_slice
        bundle_enum

        @category_words_params.each do |param|
            @category_words_param[param.keys[0]] = param.values[0]
        end
        @videos = Video.where(categorized_at: nil)
        @videos.each_slice(1000) do |videos|
            categorize_videos(videos)
        end
        puts @category_words_params
    end
end