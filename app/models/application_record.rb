class ApplicationRecord < ActiveRecord::Base
  require 'open-uri'
  require 'nokogiri'
  self.abstract_class = true

  def get_youtube_id(url)
    begin
      html = URI.open(url)
    rescue OpenURI::HTTPError => e
      puts "Error: #{e.message}"
      exit
    end
    
    doc = Nokogiri::HTML(html)
    
    meta_tags = doc.css('meta')
    
    meta_tags.each do |tag|
        url = tag['content'] if tag['name'] == "twitter:app:url:googleplay"
    end
    return url[32..55]
  end
end
