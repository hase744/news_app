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
      @videos = category
        .videos
        .where
        .not(total_seconds:nil)
        .order(published_at: :DESC)
      (2..10).each do |num|
        videos = @videos.where(total_seconds: 62..num*60)
        puts num
        if videos.count >= 10
          @videos = videos
          break
        end
      end
      @videos.each do |video|
        system("python3 downloader.py #{video.youtube_id} -o public/videos -f #{video.youtube_id}")
        #puts video_count
        if File.exist?("public/videos/#{video.youtube_id}.mp4")
          video_param = {
            'id' => video.id, 
            'youtube_id' => video.youtube_id, 
            'title' => video.title, 
            'channel_name' => video.channel_name,
            'child_categories' => category.child_categories.pluck(:name),
            'channel_id' => video.channel_id,
            'channel_youtube_id' => video.channel_youtube_id,
            'total_seconds' => video.total_seconds,
            'published_at' => video.published_at, 
            }
            puts video.id
          local_path = "public/images/#{video.youtube_id}.jpg"
             
          begin
            image_url = "http://img.youtube.com/vi/#{video.youtube_id}/sddefault.jpg"   
            puts image_url
            URI.open(image_url) do |image|
              File.open(local_path, "wb") do |file|
                file.write(image.read)
              end
            end
          rescue => e
            puts e
            image_url = "http://img.youtube.com/vi/#{video.youtube_id}/default.jpg"   
            puts image_url
            URI.open(image_url) do |image|
              File.open(local_path, "wb") do |file|
                file.write(image.read)
              end
            end
          end
          category_param['press'].push(video_param)
          video_list.push(video_param)
        end
        puts category_param['press'].length
        break if category_param['press'].length >= 10
      end
      presses.push(category_param)
    end
    fake_news_file = File.new("public/presses/fake_news.json","w")
    fake_videos_file = File.new("public/presses/fake_videos.json","w")
    #puts presses.to_json
    fake_news_file.puts(presses.to_json)
    fake_videos_file.puts(video_list.to_json)
    #system("python downloader.py gvdf5n-zI14 -o public/economy -f sample")
  end

  desc "update_json"
  task update_json: :environment do
    presses = []
    video_list = []
    video_ids = []
    
    directory_path = Rails.root.join('public', 'images')
    file_paths = Dir[Rails.root.join('public', 'images', '*')]
    file_paths.each do |file_path|
      id = file_path.split('/').last.split('.').first
      video_ids.push(id)
    end

    Category.where("start_at < ?", DateTime.now).each do |category|
      category_param = {
        "name" => category.name,
        "japanese_name" => category.japanese_name,
        'emoji' => category.emoji,
        'is_default' => category.is_default,
        'is_formal' => category.is_formal,
        "press" => [],
      }
      presses.push(category_param)
    end

    video_ids.each do |id|
      video = Video.find_by(youtube_id:id)
      if video
        video.categories.each do |category|
          category_index = presses.find_index {|hash| hash['name'] == category.name }
          presses[category_index]["press"].push(video.hash)
          video_list.push(video.hash)
        end
      end
    end
    fake_news_file = File.new("public/presses/fake_news.json","w")
    fake_videos_file = File.new("public/presses/fake_videos.json","w")
    fake_news_file.puts(presses.to_json)
    fake_videos_file.puts(video_list.to_json)
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

  desc "delete_fake_user"
  task delete_fake_user: :environment do
    User.where(is_released: false).destroy_all
  end
end