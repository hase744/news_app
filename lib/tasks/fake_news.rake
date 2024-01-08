require "open-uri"
namespace :fake_news do
  desc "download youtube_videos"
  task download: :environment do
    presses = []
    video_list = []
    Category.where("start_at < ?", DateTime.now).each do |category|
      category_param = {
        "name" => category.name,
        "japanese_name" => category.japanese_name,
        'emoji' => category.emoji,
        'is_default' => category.is_default,
        "press" => [],
      }
      videos = category
        .videos
        .where
        .not(total_seconds:nil)
        .where(total_seconds: 62..120)
        .order(published_at: :DESC)
      videos.each do |video|
        system("python downloader.py #{video.youtube_id} -o public/videos -f #{video.youtube_id}")
        #puts video_count
        if File.exist?("public/videos/#{video.youtube_id}.mp4")
          video_param = {
            'id' => video.id, 
            'youtube_id' => video.youtube_id, 
            'title' => video.title, 
            'channel_name' => video.channel_name,
            'channel_id' => video.channel_id,
            'channel_youtube_id' => video.channel_youtube_id,
            'total_seconds' => video.total_seconds,
            'published_at' => video.published_at, 
            }
            puts video.id
          image_url = "http://img.youtube.com/vi/#{video.youtube_id}/sddefault.jpg"
          local_path = "public/images/#{video.youtube_id}.jpg"
                
          URI.open(image_url) do |image|
            File.open(local_path, "wb") do |file|
              file.write(image.read)
            end
          end
          category_param['press'].push(video_param)
          video_list.push(video_param)
        end
        puts category_param['press'].length
        break if category_param['press'].length > 10
      end
      presses.push(category_param)
    end
    fake_news_file = File.new("public/videos/fake_news.json","w")
    fake_videos_file = File.new("public/videos/fake_videos.json","w")
    #puts presses.to_json
    fake_news_file.puts(presses.to_json)
    fake_videos_file.puts(video_list.to_json)
    #system("python downloader.py gvdf5n-zI14 -o public/economy -f sample")
  end

  desc "delete youtube_videos"
  task delete: :environment do
    directory_path = Rails.root.join('public', 'videos')
    files = Dir.glob("#{directory_path}/*")
    files.each do |file|
      File.delete(file)
    end
    directory_path = Rails.root.join('public', 'images')
    files = Dir.glob("#{directory_path}/*")
    files.each do |file|
      File.delete(file)
    end
  end
end