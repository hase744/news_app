require_relative 'example_class'
require_relative 'video_collection.rb'
require_relative 'youtube_key_manager.rb'
class VideoCurator
    YOUTUBE_API = Google::Apis::YoutubeV3::YouTubeService.new
    #YOUTUBE_API.key = ENV["YOUTUBE_KEY"]
    #YOUTUBE_API.key = ENV["YOUTUBE_KEY2"]

    attr_accessor :category_name
    attr_accessor :saving_videos

    def initialize(category_name = nil)
      category_name
      @saving_videos = []
      youtube_key_manager = YoutubeKeyManager.new()
      YOUTUBE_API.key = youtube_key_manager.get_key
      YOUTUBE_API.key = ENV["YOUTUBE_KEY"]
    end

    def check_all_channels
      @saving_videos = Parallel.map(Channel.all) do |channel|
        check_channels(channel)
      end
      @saving_videos = @saving_videos.flatten
      @saving_videos = @saving_videos.compact

      detect_unsaved_model
      add_index
      update_video_second
      
      puts "最終動画数：#{@saving_videos.length}"
      @collection = VideoCollection.new(@saving_videos)
      @collection.save
    end  

    def check_specific_category_channels
      @saving_videos = Parallel.map(Category.find_by(name: category_name).channels) do |channel|
        check_channels(channel)
      end
      @saving_videos = @saving_videos.flatten
      @saving_videos = @saving_videos.compact
      detect_unsaved_model
      add_index
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

    def detect_unsaved_model
      youtube_ids = @saving_videos.map { |video| video["youtube_id"] }
      saved_videos = Video.where(youtube_id: youtube_ids).map {|video| { 
        "id" => video.id, 
        "youtube_id" => video.youtube_id, 
        "total_seconds" => video.total_seconds,
        "model" => video
      }}
      puts saved_videos.length

      saved_videos.each do |saved_video|
        #puts saved_video['youtube_id']
        @saving_videos.each_with_index do |saving_video, index|
          #puts index
          if saving_video['youtube_id'] == saved_video['youtube_id']
            @saving_videos[index]["id"] = saved_video["id"]
            #puts "モデル"
            #puts saved_video["model"]
            @saving_videos[index]["model"] = saved_video["model"]
          end
        end
      end
    end

    #過去該当チャンネルの動画を15件取得
    def range_video(channel, doc)
      params = []
      for num in 1..15 do
        #puts "num : #{num}"
        youtube_id = doc.elements["feed/entry[#{num}]/yt:videoId"].text
        video_info = doc.elements["feed/entry[#{num}]"]
        title = video_info.elements["title"].text
        description = video_info.elements["media:group/media:description"].text
        total_views = video_info.elements["media:group/media:community/media:statistics"].attributes["views"]

        if youtube_id.present?
          param = {
            "youtube_id"=>youtube_id, 
            #"second"=>video_second,
            "channel_id"=>channel.id,
            "description"=>description,
            "published_at"=>video_info.elements["published"].text,
            "title"=> title,
            "total_views" => total_views
          }
          params.push(param)
        end
      end
      return params
    end

    def add_index
      @saving_videos.each_with_index do |video, index|
        @saving_videos[index]["index"] = index
      end
    end

    def update_video_second
      #YoutubeAPIの一度に取得できる動画数が50本であるため
      #{"index"=>"3", "second"=>"2232"}のようなハッシュの配列を取得
      unsaved_videos = @saving_videos.select { |video| !video.key?("id") }
      index_and_seconds = []
      index_and_seconds = Parallel.map(unsaved_videos.each_slice(50)) do |video_slice|
        result = get_total_second_in_slice(video_slice)
        p result
      end
      index_and_seconds = index_and_seconds.flatten #二次元配列を解除
      index_and_seconds.each do |index_and_second|
        @saving_videos[index_and_second['index']]['total_seconds'] = index_and_second['total_seconds']
        @saving_videos[index_and_second['index']]['live_status'] = index_and_second['live_status']
      end
    end
    
    def get_total_second_in_slice(video_slice)
      begin
        youtube_ids = video_slice.map { |hash| hash["youtube_id"] }
        youtube_ids = youtube_ids.join(',')
        video_response = YOUTUBE_API.list_videos('contentDetails', id:youtube_ids)
        index_and_seconds = []
        video_response.items.each_with_index do |video, index|
          index_and_second = {}
          time_str = video.content_details.duration
          total_seconds = time_str_to_seconds(time_str)

          index_and_second["total_seconds"] = total_seconds #秒数を格納
          index_and_second["index"] = video_slice[index]['index'] #indexを格納
          index_and_seconds.push(index_and_second)
        end

        video_response = YOUTUBE_API.list_videos('snippet', id: youtube_ids)
        video_response.items.each_with_index do |video, index|
          index_and_seconds[index]["live_status"] = video.snippet.live_broadcast_content
        end
        puts index_and_seconds
        return index_and_seconds
      rescue => e
        if e.to_s.include?('quotaExceeded')
          puts "使い切った"
          puts e
        elsif e.to_s.include?('forbidden')
          puts e
        else
          puts e
        end
      end
    end

    def time_str_to_seconds(time_str)
      minutes, seconds = time_str.scan(/\d+/).map(&:to_i)
      minutes ||= 0
      seconds ||= 0
      total_seconds = minutes * 60 + seconds #秒数を生成
      total_seconds
    end
end