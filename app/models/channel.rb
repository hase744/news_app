class Channel < ApplicationRecord
  has_many :channel_categories, class_name: "ChannelCategory", dependent: :destroy
  has_many :categories, through: :channel_categories
  has_many :videos
  validates :youtube_id, uniqueness: true
  validates :name, presence: true

  before_validation :check_url_or_channel_id
  before_validation :insert_youtube_id_from_url
  before_validation :insert_channel_name_from_id
  before_validation :insert_main_link
  before_validation :insert_image_url
  after_create :create_videos

  scope :for_publish, -> {
      where(is_fake: false)
  }

  def check_url_or_channel_id
    if self.url.nil? && self.youtube_id.nil? 
      erros.add(:url) if self.url.nil?
      erros.add(:youtube_id) if self.youtube_id.nil? 
    end
  end

  def insert_youtube_id_from_url
      if self.url && will_save_change_to_url?
          self.youtube_id = get_youtube_id(self.url)
      end
  end

  def set_detail
    encoded_url = URI::DEFAULT_PARSER.escape(self.url)
    self.youtube_id = get_youtube_id(encoded_url)
    self.name = get_channel_name(self.youtube_id)
    self.image_url = get_image_url(url) || ''
    unless url.match(/^https:\/\/www\.youtube\.com\/@/)
      self.url = get_main_link(url)
    end
  end

  def insert_main_link
      if !url.match(/^https:\/\/www\.youtube\.com\/@/)
          self.url = get_main_link(url)
      end
  end

  def insert_image_url
    self.image_url = get_image_url(url)
  end

  def insert_channel_name_from_id
      if self.url && will_save_change_to_url?
          self.name = get_channel_name(self.youtube_id)
      end
  end
  
  def update_channel_name
      self.update(name: get_channel_name(self.youtube_id))
  end

  def output_hash
    {
      'name' => name,
      'image_url' => image_url,
      'youtube_id' => youtube_id
    }
  end
  
  def video_infos_from_feed
    puts youtube_id
    return if !url.present?
    return if !self.youtube_id.present?
    feed_url = "https://www.youtube.com/feeds/videos.xml?channel_id=#{youtube_id}"
    begin 
      doc = REXML::Document.new(URI.open(feed_url).read)
      (1..15).map do |num|
        break if !doc.elements["feed/entry[#{num}]/yt:videoId"].present?
        youtube_id = doc.elements["feed/entry[#{num}]/yt:videoId"].text
        video_info = doc.elements["feed/entry[#{num}]"]
        title = video_info.elements["title"].text
        description = video_info.elements["media:group/media:description"].text
        total_views = video_info.elements["media:group/media:community/media:statistics"].attributes["views"]
          {
            "youtube_id"=> youtube_id, 
            "channel_id"=> id,
            "description"=> description,
            "published_at"=> video_info.elements["published"].text,
            "title"=> title,
            "total_views" => total_views
          }
      end
    rescue => e
      puts e
      return nil
    end
  end

  def create_videos
      return if self.videos.length > 0
      return if video_infos_from_feed.nil?
      saving_videos = video_infos_from_feed
          .flatten
          .compact
      saving_videos = video_params_with_detail(saving_videos)
      Video.insert_all_filtering_keys(saving_videos)
  end

  def self.video_params_with_detail(params)
    video_params_with_detail(params)
  end

  def video_params_with_detail(params)
    begin
      youtube_ids = params.map { |hash| hash["youtube_id"] }
      youtube_ids = youtube_ids.join(',')

      video_response = YOUTUBE_API.list_videos('contentDetails', id:youtube_ids)
      video_response.items.each_with_index do |video, index|
        index_and_detail = {}
        time_str = video.content_details.duration
        total_seconds = time_str_to_seconds(time_str)
        params[index]["total_seconds"] = total_seconds #秒数を格納
      end

      video_response = YOUTUBE_API.list_videos('snippet', id: youtube_ids)
      video_response.items.each_with_index do |video, index|
        params[index]["live_status"] = video.snippet.live_broadcast_content
      end

      video_response = YOUTUBE_API.list_videos('liveStreamingDetails', id: youtube_ids)
      video_response.items.each_with_index do |video, index|
        params[index]["is_live"] = video.live_streaming_details != nil
      end
      return params
    rescue => e
      if e.to_s.include?('quotaExceeded')
        puts "APIの使用上限"
        puts e
      elsif e.to_s.include?('forbidden')
        puts e
      else
        puts e
      end
    end
    end
end
