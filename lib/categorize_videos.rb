class VideoCategorizer
    include ActiveModel::Conversion
    extend ActiveModel::Naming
    extend ActiveModel::Translation
    include ActiveModel::AttributeMethods
    include ActiveModel::Validations
    CHANNEL_CATEGORY_PARAMS = []
    def check_videos
        params = {}
        Category.all.each do |c|
            c.where(category: category).each do |category|
            end
        end

        @list = {}
        CategoryWord.all.each do |cw|
            array = JSON.parse cw.word
            if @list[category.name] == []
                @list[category.name] = array
            else
                @list[category.name] = @list[category.name].concat(array)
            end
        end


        Video.where(is_categorized: false).each do |video|
            @list.keys.each do |key|
                @list[key].each do |word|
                    if video.description.index(word) != nil¥
                      puts "#{video.title}を#{word}にカテゴライズ"
                      return title.index(word)
                      break;
                    end
                end
            end
        end
    end
end