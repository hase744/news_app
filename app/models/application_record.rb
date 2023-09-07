class ApplicationRecord < ActiveRecord::Base
  YOUTUBE_API = Google::Apis::YoutubeV3::YouTubeService.new
  YOUTUBE_API.key = ENV["YOUTUBE_KEY2"]
  require 'open-uri'
  require 'nokogiri'
  self.abstract_class = true

  def get_youtube_id(url)
    begin
      html = URI.open(url)
    rescue OpenURI::HTTPError => e
      puts "#{url} Error: #{e.message}"
      return
    end
    
    doc = Nokogiri::HTML(html)
    
    meta_tags = doc.css('meta')
    
    meta_tags.each do |tag|
        url = tag['content'] if tag['name'] == "twitter:app:url:googleplay"
    end
    return url[32..55]
  end

  def get_channel_name(channel_id)
    begin
      # チャンネル情報を取得
      channel = YOUTUBE_API.list_channels('snippet', id: channel_id).items.first
      channel_name = channel.snippet.title
      
      puts "チャンネル名: #{channel_name}"
      return channel_name
    rescue StandardError => e
      puts "エラーが発生しました: #{e.message}"
    end
  end
end
