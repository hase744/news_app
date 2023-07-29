require_relative 'example_class'
require_relative 'video_collection.rb'
class VideoSaver
    YOUTUBE_API = Google::Apis::YoutubeV3::YouTubeService.new
    YOUTUBE_API.key = ENV["YOUTUBE_KEY"]

    attr_accessor :category_name
    attr_accessor :saving_videos

    def initialize(category_name)
        category_name
        @saving_videos = []
    end

    def check_all_channels
      Category.all.each do |category|
          category_name = category.name
          check_channels(category)
      end
      @collection = VideoCollection.new(@saving_videos)
      @collection.save
    end  

    def check_specific_category_channels
      check_channels(Category.find_by(name: category_name))
      @collection = VideoCollection.new(@saving_videos)
      @collection.save
    end

    def check_channels(category)
        category.channels.each do |channel|
            url = "https://www.youtube.com/feeds/videos.xml?channel_id=#{channel.youtube_id}"
            doc = REXML::Document.new(URI.open(url).read)
            begin
                range_video(channel,doc)
            rescue => e
              if e.message == "404 Not Found"
                puts url + "は見つかりませんでした"
              end
              puts e
            end
      end
    end

    #過去該当チャンネルの動画を15件取得
    def range_video(channel, doc)
      for num in 1..15 do
        puts "num : #{num}"
        youtube_id = doc.elements["feed/entry[#{num}]/yt:videoId"].text
        video_info = doc.elements["feed/entry[#{num}]"]
        description = video_info.elements["media:group/media:description"].text
        total_views = video_info.elements["media:group/media:community/media:statistics"].attributes["views"]
        hash_tag = description.scan(/#[^\s#]+/)
        video_second = get_video_second( youtube_id)

        if video_second < 1800 #&& word_to_categorize != nil  #30分未満の動画のみ保存
          puts "break"
          video = Video.find_by(youtube_id: youtube_id)
          if video.present?
            puts "the video is already saved"
            @saving_videos.push(
              {
                "id"=>video.id,
                "total_views" => total_views
              }
              )
          else
            @saving_videos.push(
              {
                "youtube_id"=>youtube_id, 
                "second"=>video_second,
                "channel_id"=>channel.id,
                "description"=>description,
                "published_at"=>video_info.elements["published"].text,
                "title"=> video_info.elements["title"].text,
                "total_views" => total_views
              }
              )
            puts "this video is new"
          end
          
          #video.video_categories.create(category: Category.find_by(name: category_name))
          break
        else
          puts video_info.elements["title"].text + "　は３０分以上、もしくは用語が含まれなかったためのため保存されませんでした"
        end
      end
    end
    
    def search_word(title)
      @words = []
      CategoryWord.where(category:"business").each do |row|
        array = JSON.parse row.word
        @words.push(array)
      end
      @words.flatten!
      #puts @words
      @words.each do |word|
        if title.index(word) != nil
          puts title.index(word)
          puts word
          return title.index(word)
          break;
        end
      end
      return nil
    end
    
    def get_video_second(youtube_id)
        timeresponse = YOUTUBE_API.list_videos('contentDetails', id: youtube_id).to_json
        video_second = JSON.parse(timeresponse)["items"][0]["contentDetails"]["duration"]
        minits_of_video_second = ActiveSupport::Duration.parse(video_second)
        puts "video_second#{minits_of_video_second}"
        return minits_of_video_second
    end
end