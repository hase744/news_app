require_relative '../../lib/example_class'
require_relative '../../lib/video_curator'
require_relative '../../lib/video_categorizer'
require_relative '../../lib/press_creator'
require_relative '../../db/channels'
namespace :news do
  desc "aa" #desc → description（説明）
  task task_name: :environment do #task_nameは自由につけられる
    # 実行したい処理を記述する場所
    example_class = ExampleClass.new
    example_class.test
  end

  desc "動画を収集してカテゴライズしてニュースを作成"
  task update_all_info: :environment do
    puts "creating pressw"
    video_finder = VideoCurator.new
    video_finder.check_all_channels
    video_categorizer = VideoCategorizer.new
    video_categorizer.categorize
    press_creator = PressCreator.new
    press_creator.create_news
    #find_new_video.check_specific_category_channel
  end

  desc "動画を収集"
  task curate_videos: :environment do
    puts "curating video"
    video_finder = VideoCurator.new
    video_finder.check_all_channels
    #find_new_video.check_specific_category_channel
  end

  desc "特定のカテゴリーの動画を収集"
  task :curate_videos_of, :category do |task, args|
    puts "Hello, #{args[:category]}!"
    puts "curating video"
    # rake news:"curate_videos_of[game]"　で実行するとなぜかエラーを起こす
    video_finder = VideoCurator.new(category_name:"business")
    video_finder.category_name = "business"
    video_finder.check_specific_category_channels
    #find_new_video.check_specific_category_channel
  end
  
  desc "特定のカテゴリーの動画を収集"
  task curate_each_video: :environment do
    puts "curating video"
    Category.all.each do |category|
      video_finder = VideoCurator.new(category_name: category.name)
      video_finder.category_name = category.name
    end
    #find_new_video.check_specific_category_channel
  end
  
  desc "ゲームのカテゴリーの動画を収集"
  task curate_game_videos: :environment do
    puts "curating game videos"
    #なぜかエラーを起こす
    video_finder = VideoCurator.new(category_name:"game")
    video_finder.category_name = "game"
    video_finder.check_specific_category_channels
    #find_new_video.check_specific_category_channel
  end
  
  desc "文房具のカテゴリーの動画を収集"
  task curate_stationary_videos: :environment do
    puts "curating videos of stationary"
    video_finder = VideoCurator.new(category_name:"stationary")
    video_finder.category_name = "stationary"
    video_finder.check_specific_category_channels
  end

  desc "弁当のカテゴリーの動画を収集"
  task curate_bento_videos: :environment do
    puts "curating videos of bento"
    video_finder = VideoCurator.new(category_name:"bento")
    video_finder.category_name = "bento"
    video_finder.check_specific_category_channels
  end
  
  task categorize_videos: :environment do
    puts "categorizing videos"
    video_categorizer = VideoCategorizer.new
    video_categorizer.categorize
    #find_new_video.check_specific_category_channel
  end

  task recategorize_videos: :environment do
    puts "recategorizing videos"
    videos = Video.where(published_at: (DateTime.now-1)..DateTime.now)
    videos.update_all(categorized_at:nil)
    video_categorizer = VideoCategorizer.new
    video_categorizer.categorize
    #find_new_video.check_specific_category_channel
  end

  task create_news: :environment do
    puts "creating press"
    press_creator = PressCreator.new
    press_creator.create_news
    #find_new_video.check_specific_category_channel
  end

  task get_conflict_channel: :environment do
    puts "不一致"
    Channel.all.each do |channel|
      channel_categories = channel.channel_categories
      channel_hash = @channel_seeds.find {|hash| hash["url"] == channel["url"]}
      channel_categories.each do |cc|
        if channel_hash.present?
          if cc.is_absolute
            if !(channel_hash["absolute"].present? || channel_hash["categories"].length == 1)
                puts channel.url
            elsif channel_hash["absolute"].present? && !channel_hash["absolute"].include?(cc.category.name)
                puts channel.url
            elsif !channel_hash["categories"].include?(cc.category.name)
                puts channel.url
            end
          else
            if channel_hash["absolute"].present? && channel_hash["absolute"].include?(cc.channel.name)
                puts channel.url
            elsif (channel_hash["categories"].include?(cc.channel.name) && channel_hash["categories"].length == 1)
                puts channel.url
            end
          end
        else
          puts channel.url
        end
      end
    end
  end
end
