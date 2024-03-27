require "open-uri"
namespace :fake_news do
  desc "create_channel youtube_videos"
  task create_channel: :environment do
    channel = Channel.find_or_create_by(
      url: 'https://www.youtube.com/@QuickNewsJa',
      is_fake: true
    )
    json_data = File.read("public/channel_videos.json")
    @videos = JSON.parse(json_data)
    categories = Category.normal
    categories.each_with_index do |c, i|
      puts i
      10.times do |n|
        @video = @videos[i*10+n]
        publishe_at = DateTime.parse(@video['snippet']['publishedAt'])
        video = Video.find_by(
          youtube_id: @video['id'],
          channel: nil,
        )
        video.destroy if video.present?
        video = Video.find_by(
          youtube_id: @video['id'],
          channel: channel,
        )
        puts video.present?
        video = Video.create(
          youtube_id: @video['id'],
          title: "#{publishe_at.strftime("%Y年%m月%d日")} #{c.japanese_name}についてのニュース",
          total_seconds: 60 + rand(0..5)*n,
          description: @video['snippet']["description"],
          published_at: publishe_at,
          total_views: rand(0..100),
          channel: channel,
          live_status: "none"
        ) if !video.present?
        puts video.id
        video.video_categories.find_or_create_by(category: c)
      end
    end
  end

  desc "download youtube_videos"
  task download: :environment do
    presses = []
    video_list = []
    channel_names = ["ERESTAGE LAB", "新R25チャンネル", "日本株チャンネル【坂本彰】", "不動産Gメン滝島", "オタミリch", "けいじチャンネル", "クレアの時事ニュース【2nd】", "in living.", "uchilog（ウチログ）", "コスメヲタちゃんねるサラ", "中野社長 / クルマの通販「BUDDICAダイレクト」", "AI収益化ラボ", "上念司チャンネル ニュースの虎側", "堀江貴文 ホリエモン", "別冊！ニューソク通信", "トーマスガジェマガ", "那須大亮 / Daisuke Nasu", "ラブテクチャンネル", "げんじ/Genji", "スマサポチャンネル", "エプロン", "SUSURU TV.", "amity_sensei", "内定チャンネル", "さっかー情報館", "2ch野球スレ魂", "【FX予想】先出しトレーダーコジコジ", "フジマナ /資産100億狙う投資家", "ろぺるん Roperun 文房具チャンネル", "ふみたろ", "こぐまいたんカフェ"]
    categories = Category.normal

    presses = Parallel.map(categories) do |category|
    #presses = categories.map do |category|
    #presses = categories.where(name: ['technology','gourmet']).map do |category|
      puts category.japanese_name
      category_param = {
        "name" => category.name,
        "japanese_name" => category.japanese_name,
        'emoji' => category.emoji,
        'is_default' => category.is_default,
        "press" => [],
      }
      titles = category
        .channels
        .where(name: channel_names)
        .flat_map(&:videos)
        .uniq
        .pluck(:title)
      @videos = category.videos
        .joins(:channel)
        .where(channel: {is_fake: true})
      @videos.each_with_index do |video, i|
        video.title = titles[i]
      end
      category_array = []
      File.open("./public/jsons/#{category.name}.json") do |f|
        category_array = JSON.load(f)
      end
      @videos.each_with_index do |video, n|
        break if n > 9
        text = category_array[n]['description']
        system("python3 video_creator.py #{video.decoded_id} -t '#{text}' -c #{category.name} -o public/videos -f #{video.youtube_id}")
        #system("python3 downloader.py #{video.decoded_id} -o public/videos -f #{video.youtube_id}")
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
             
          #begin
          #  image_url = "http://img.youtube.com/vi/#{video.decoded_id}/sddefault.jpg"   
          #  puts image_url
          #  URI.open(image_url) do |image|
          #    File.open(local_path, "wb") do |file|
          #      file.write(image.read)
          #    end
          #  end
          #rescue => e
          #  puts e
          #  image_url = "http://img.youtube.com/vi/#{video.decoded_id}/default.jpg"   
          #  puts image_url
          #  URI.open(image_url) do |image|
          #    File.open(local_path, "wb") do |file|
          #      file.write(image.read)
          #    end
          #  end
          #end
          category_param['press'].push(video_param)
        end
      end
      category_param
    end
    video_list = presses.map{|press| press["press"]}.flatten
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
          presses[category_index]["press"].push(video.savind_hash)
          video_list.push(video.savind_hash)
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
    directory_path = Rails.root.join('public', 'audios')
    files = Dir.glob("#{directory_path}/*")
    files.each do |file|
      File.delete(file)
    end
  end

  desc "delete_fake_user"
  task delete_fake_user: :environment do
    User.where(is_released: false).destroy_all
  end

  desc "get differ channel"
  task get_differ: :environment do
    channel_names = ["ERESTAGE LAB", "新R25チャンネル", "日本株チャンネル【坂本彰】", "不動産Gメン滝島", "オタミリch", "けいじチャンネル", "クレアの時事ニュース【2nd】", "in living.", "uchilog（ウチログ）", "コスメヲタちゃんねるサラ", "中野社長 / クルマの通販「BUDDICAダイレクト」", "AI収益化ラボ", "上念司チャンネル ニュースの虎側", "堀江貴文 ホリエモン", "別冊！ニューソク通信", "トーマスガジェマガ", "那須大亮 / Daisuke Nasu", "ラブテクチャンネル", "げんじ/Genji", "スマサポチャンネル", "エプロン", "SUSURU TV.", "amity_sensei", "内定チャンネル", "さっかー情報館", "2ch野球スレ魂", "【FX予想】先出しトレーダーコジコジ", "フジマナ /資産100億狙う投資家", "ろぺるん Roperun 文房具チャンネル", "ふみたろ", "こぐまいたんカフェ"]
    categories = Category.normal

    channels = Channel.where(name: channel_names)
    categories2 = channels.flat_map(&:categories).uniq
    puts categories2.pluck(:name)
    puts categories2.length
    puts categories.length

    puts categories2.pluck(:name) - categories.pluck(:name)
    puts categories.pluck(:name) - categories2.pluck(:name)
  end
end