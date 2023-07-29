require_relative 'video_category_collection.rb'
class VideoCategorizer
    CHANNEL_CATEGORY_PARAMS = []
    def categorize
        @video_category_params = []
        @category_words_params = []
        #[{"category":"word", "words":["アメリカ","中国"]}]のようなパラメーターを作る
        Category.all.each do |category|
            param = {}
            param["category_name"] = category.name
            param["words"] = []
            WordList.where(category:category).each do |wl|
                words_array = wl.words.split(',')
                param["words"] = param["words"].concat words_array
            end
            @category_words_params.push(param)
        end

        videos = Video.where(is_categorized: false)
        videos.each do |video|
            @category_words_params.each do |param|
                category = Category.find_by(name: param["category_name"])
                param["words"].each do |word|
                    if video.title.index(word) != nil
                        @video_category_params.push({"video_id"=>video.id,"category_id"=>category.id})
                        puts "#{video.title}を#{category.name}にカテゴライズ"
                        break;
                    end
                end
            end 
        end

        videos.update_all(is_categorized:true)

        if videos.present?
            @video_category_collection = VideoCategoryCollection.new(@video_category_params)
            @video_category_collection.save
        end
    end
end