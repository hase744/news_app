class YoutubeKeyManager
  def get_key
    youtube_key_file = Rails.root.join('config', 'youtube_key_name.txt')
    youtube_key_name = ""
    unless File.exist?(youtube_key_file)#ファイルが存在しないとき
      File.open(youtube_key_file, 'w') do |file|
        file.puts("YOUTUBE_KEY1")
      end
      puts "youtube_key.txt file created and ENV['YOUTUBE_KEY'] saved."
    else
      puts "youtube_key.txt file already exists."
    end
    
    if File.exist?(youtube_key_file)
      File.open(youtube_key_file, 'r') do |file|
        youtube_key_name = file.read.chomp #改行\nを取り除く
        # youtube_key_nameにファイルから読み取った値が格納される
        puts "YouTube Key: #{youtube_key_name}"
      end
    else
      puts "youtube_key.txt file does not exist."
    end
    #puts ENV["#{youtube_key_name}"]
    return ENV["#{youtube_key_name}"]
  end

  def change_key
    key = nil
    index = 0
    youtube_key_file = Rails.root.join('config', 'youtube_key_name.txt')
    if File.exist?(youtube_key_file)
      File.open(youtube_key_file, 'r') do |file|
        youtube_key_name = file.read
        index = youtube_key_name.scan(/\d+/)[0].to_i
      end
      File.open(youtube_key_file, 'w') do |file|
        file.puts("YOUTUBE_KEY#{index+1}")
      end
    else
      puts "youtube_key.txt file does not exist."
    end
  end
end