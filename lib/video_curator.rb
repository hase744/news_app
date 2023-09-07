require_relative 'example_class'
require_relative 'video_collection.rb'
class VideoCurator
    YOUTUBE_API = Google::Apis::YoutubeV3::YouTubeService.new
    YOUTUBE_API.key = ENV["YOUTUBE_KEY2"]

    attr_accessor :category_name
    attr_accessor :saving_videos

    def initialize(category_name = nil)
        category_name
        @saving_videos = []
    end

    def check_all_channels
      Channel.all.each do |channel|
      #@saving_videos = Parallel.map(Channel.all) do |channel|
        #@saving_videos = []
        check_channels(channel)
        puts "動画数：#{@saving_videos.length}"
        #return @saving_videos
      end
      update_video_second
      puts "最終動画数：#{@saving_videos.length}"
      @collection = VideoCollection.new(@saving_videos)
      @collection.save
    end  

    def check_specific_category_channels
      Category.find_by(name: category_name).channels.each do |channel|
        check_channels(channel)
      end
      update_video_second
      @collection = VideoCollection.new(@saving_videos)
      @collection.save
    end

    def check_channels(channel)
      url = "https://www.youtube.com/feeds/videos.xml?channel_id=#{channel.youtube_id}"
      puts url
      begin
        doc = REXML::Document.new(URI.open(url).read)
        range_video(channel,doc)
      rescue => e
        puts "エラー"
        if e.message == "404 Not Found"
          puts url + "は見つかりませんでした"
        end
        puts e
      end
    end

    #過去該当チャンネルの動画を15件取得
    def range_video(channel, doc)
      for num in 1..15 do
        #puts "num : #{num}"
        youtube_id = doc.elements["feed/entry[#{num}]/yt:videoId"].text
        video_info = doc.elements["feed/entry[#{num}]"]
        title = video_info.elements["title"].text
        description = video_info.elements["media:group/media:description"].text
        total_views = video_info.elements["media:group/media:community/media:statistics"].attributes["views"]

        if youtube_id
          video = Video.find_by(youtube_id: youtube_id)
          if video.present? #既存のは再生数を更新
            puts "the video is already saved"
            param = {
              "id"=>video.id,
              "youtube_id"=>youtube_id, 
              "total_views" => total_views
            }
          else #新規のは全てのカラムを保存
              param = {
                "youtube_id"=>youtube_id, 
                #"second"=>video_second,
                "channel_id"=>channel.id,
                "description"=>description,
                "published_at"=>video_info.elements["published"].text,
                "title"=> title,
                "total_views" => total_views
              }
            puts "the video is new"
          end
          @saving_videos.push(param)
        end
      end
    end

    def update_video_second
      puts "update_video_second"
      second_params = []
      second_params = Parallel.map(@saving_videos) do |video|
        param = {}
        param["youtube_id"] = video["youtube_id"]
        param["second"] = get_video_second(video["youtube_id"])
        param
      end

      id_to_second = {}
      second_params.each do |param|
        id_to_second[param["youtube_id"]] = param["second"]
      end

      @saving_videos.each_with_index do |video, index|
        @saving_videos[index]["second"] = id_to_second[video["youtube_id"]]
      end

    end
    
    def get_video_second(youtube_id)
      begin
        timeresponse = YOUTUBE_API.list_videos('contentDetails', id: youtube_id).to_json
        video_second = JSON.parse(timeresponse)["items"][0]["contentDetails"]["duration"]
        minits_of_video_second = ActiveSupport::Duration.parse(video_second)
        return minits_of_video_second.to_i
      rescue => e
        puts e
      end
    end
end