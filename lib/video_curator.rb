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
      @saving_videos = Parallel.map(Channel.for_publish) do |channel|
        channel.video_infos_from_feed
      end
      @saving_videos = @saving_videos.flatten
      @saving_videos = @saving_videos.compact

      detect_unsaved_model
      add_index
      update_video_detail
      
      puts "最終動画数：#{@saving_videos.length}"
      Video.insert_all_filtering_keys(@saving_videos)
      #@collection = VideoCollection.new(@saving_videos)
      #@collection.save
    end  

    def check_channels_in_slice
      Channel.for_publish.each_slice(300).each do |channels|
        @saving_videos = Parallel.map(channels) do |channel|
          channel.video_infos_from_feed
        end
        @saving_videos = @saving_videos.flatten
        @saving_videos = @saving_videos.compact

        detect_unsaved_model
        add_index
        update_video_detail

        puts "最終動画数：#{@saving_videos.length}"
        Video.insert_all_filtering_keys(@saving_videos)
        #@collection = VideoCollection.new(@saving_videos)
        #@collection.save
      end
    end

    def check_specific_category_channels
      @saving_videos = Parallel.map(Category.find_by(name: category_name).channels) do |channel|
        channel.video_infos_from_feed
      end
      @saving_videos = @saving_videos.flatten
      @saving_videos = @saving_videos.compact
      detect_unsaved_model
      add_index
      update_video_detail
      Video.insert_all_filtering_keys(@saving_videos)
      #@collection = VideoCollection.new(@saving_videos)
      #@collection.save
    end

    def video_infos_from_feed
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
        index = @saving_videos.index { |hash| hash['youtube_id'] == saved_video['youtube_id'] }
        @saving_videos[index]["id"] = saved_video["id"]
        @saving_videos[index]["model"] = saved_video["model"]
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

    def update_video_detail
      #YoutubeAPIの一度に取得できる動画数が50本であるため
      #{"index"=>"3", "second"=>"2232"}のようなハッシュの配列を取得
      unsaved_videos = @saving_videos.select { |video| !video.key?("id") }
      puts "総数 : #{@saving_videos.count}"
      puts "新規 : #{unsaved_videos.count}"
      index_and_details = []
      index_and_details = Parallel.map(unsaved_videos.each_slice(50)) do |video_slice|
        result = get_detail_in_slice(video_slice)
        #p result
      end
      index_and_details = index_and_details.flatten #二次元配列を解除
      index_and_details.each do |index_and_detail|
        @saving_videos[index_and_detail['index']]['total_seconds'] = index_and_detail['total_seconds']
        @saving_videos[index_and_detail['index']]['live_status'] = index_and_detail['live_status']
        @saving_videos[index_and_detail['index']]['is_live'] = index_and_detail['is_live']
      end
    end
    
    def get_detail_in_slice(video_slice)
      begin
        youtube_ids = video_slice.map { |hash| hash["youtube_id"] }
        youtube_ids = youtube_ids.join(',')

        index_and_details = []
        video_response = YOUTUBE_API.list_videos('contentDetails', id:youtube_ids)
        ids_to_pass = []
        video_response.items.each_with_index do |video, index|
          index_and_detail = {}
          time_str = video.content_details.duration
          if time_str == nil #動画が公開済みではない場合
            ids_to_pass.push(video.id)
            puts "YouTube ID: #{video.id} : #{time_str}"
            next 
          end
          total_seconds = time_str_to_seconds(time_str)

          index_and_detail["youtube_id"] = video.id
          index_and_detail["total_seconds"] = total_seconds #秒数を格納
          index_and_detail["index"] = video_slice[index]['index'] #indexを格納
          index_and_details.push(index_and_detail)
        end

        video_response = YOUTUBE_API.list_videos('snippet', id: youtube_ids)
        video_response.items do |video|
          next if ids_to_pass.include?(video.id)
          index = index_and_details.index{|param| param['youtube_id'] == video.id}
          index_and_details[index]["live_status"] = video.snippet.live_broadcast_content
        end

        video_response = YOUTUBE_API.list_videos('liveStreamingDetails', id: youtube_ids)
        video_response.items do |video|
          next if ids_to_pass.include?(video.id)
          index = index_and_details.index{|param| param['youtube_id'] == video.id}
          index_and_details[index]["is_live"] = video.live_streaming_details != nil
        end

        #puts index_and_details
        return index_and_details
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
      hours = time_str.scan(/\d+H/)[0].to_i
      minutes = time_str.scan(/\d+M/)[0].to_i
      seconds = time_str.scan(/\d+S/)[0].to_i
      total_seconds = (minutes + hours *60) *60 + seconds #秒数を生成
      total_seconds
    end
end