require_relative 'example_class'
require_relative 'video_collection.rb'
class VideoCurator
    YOUTUBE_API = Google::Apis::YoutubeV3::YouTubeService.new
    YOUTUBE_API.key = ENV["YOUTUBE_KEY"]

    attr_accessor :category_name
    attr_accessor :saving_videos

    def initialize(category_name = nil)
        category_name
        @saving_videos = []
    end

    def check_all_channels
      Channel.all.each do |channel|
        check_channels(channel)
      end
      @collection = VideoCollection.new(@saving_videos)
      @collection.save
    end  

    def check_specific_category_channels
      Category.find_by(name: category_name).channels.each do |channel|
        check_channels(channel)
        @collection = VideoCollection.new(@saving_videos)
        @collection.save
      end
    end

    def check_channels(channel)
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

    #過去該当チャンネルの動画を15件取得
    def range_video(channel, doc)
      for num in 1..15 do
        puts "num : #{num}"
        youtube_id = doc.elements["feed/entry[#{num}]/yt:videoId"].text
        video_info = doc.elements["feed/entry[#{num}]"]
        title = video_info.elements["title"].text
        description = video_info.elements["media:group/media:description"].text
        total_views = video_info.elements["media:group/media:community/media:statistics"].attributes["views"]
        hash_tag = description.scan(/#[^\s#]+/)
        video_second = get_video_second( youtube_id)
        

        if video_second < 1800 #30分未満の動画のみ保存
          video = Video.find_by(youtube_id: youtube_id)
          if video.present? #既存のは再生数を更新
            puts "the video is already saved"
            @saving_videos.push(
              {
                "id"=>video.id,
                "total_views" => total_views
              })
          else #新規のは全てのカラムを保存
            @saving_videos.push(
              {
                "youtube_id"=>youtube_id, 
                "second"=>video_second,
                "channel_id"=>channel.id,
                "description"=>description,
                "published_at"=>video_info.elements["published"].text,
                "title"=> title,
                "total_views" => total_views
              })
            puts "the video is new"
          end
          
        else
          puts video_info.elements["title"].text + "　は３０分以上、もしくは用語が含まれなかったためのため保存されませんでした"
        end
      end
    end
    
    def get_video_second(youtube_id)
        timeresponse = YOUTUBE_API.list_videos('contentDetails', id: youtube_id).to_json
        video_second = JSON.parse(timeresponse)["items"][0]["contentDetails"]["duration"]
        minits_of_video_second = ActiveSupport::Duration.parse(video_second)
        puts "video_second#{minits_of_video_second}"
        return minits_of_video_second
    end
end