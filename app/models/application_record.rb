class ApplicationRecord < ActiveRecord::Base
  YOUTUBE_API = Google::Apis::YoutubeV3::YouTubeService.new
  YOUTUBE_API.key = ENV["YOUTUBE_KEY2"]
  require 'open-uri'
  require 'nokogiri'
  attr_accessor :html
  attr_accessor :doc
  self.abstract_class = true

  def get_youtube_id(url)
    doc = get_document(url)
    return if doc.nil?
    
    meta_tags = doc.css('meta')
    
    meta_tags.each do |tag|
      url = tag['content'] if tag['name'] == "twitter:app:url:googleplay"
    end
    return url[32..55]
  end

  def get_main_link(url)
    doc = get_document(url)
    return if doc.nil?
    #file = File.new("index.html","w")
    #file.puts(doc)
    link = doc.to_s.match(/http:\/\/www\.youtube\.com\/@([^"]+)/)[0]
    
    if link
      return "https://www.youtube.com/@" + link.match(/@(.*)$/)[1]
    else
      puts "対応するリンクが見つかりませんでした。"
    end
  end

  def get_image_url(url)
    doc = get_document(url)
    return if doc.nil?
    link_element = self.doc.at('link[rel="image_src"]')
    #file = File.new("index.html","w")
    #file.puts(self.doc)

    if link_element && link_element['href']
      href_value = link_element['href']
      url = href_value.split('=')[0]
      return url if url.present?
      return ''
    else
      puts "対応するイメージが見つかりませんでした。"
      return ''
    end
  end

  def get_channel_name(channel_id)
    begin
      puts "チャンネルID #{channel_id}"
      # チャンネル情報を取得
      channel = YOUTUBE_API.list_channels('snippet', id: channel_id).items.first
      channel_name = channel.snippet.title
      
      puts "チャンネル名: #{channel_name}"
      return channel_name
    rescue StandardError => e
      puts "#{channel_name}でエラーが発生しました: #{e.message}"
      return ''
    end
  end

  def get_document(url)
    begin
      self.html = URI.open(url) if self.html.nil?
      self.doc = Nokogiri::HTML(self.html) if self.doc.nil?
      return self.doc
    rescue OpenURI::HTTPError => e
      puts "#{url} Error: #{e.message}"
      return
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
