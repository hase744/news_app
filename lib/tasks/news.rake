require_relative '../../lib/example_class'
require_relative '../../lib/video_curator'
require_relative '../../lib/video_categorizer'
require_relative '../../lib/press_creator'
require_relative '../../lib/enumeration_updater.rb'
require_relative '../../lib/category_updater.rb'
require_relative '../../lib/channel_updater.rb'
namespace :news do
  desc "aa" #desc → description（説明）
  task task_name: :environment do #task_nameは自由につけられる
    # 実行したい処理を記述する場所
    example_class = ExampleClass.new
    example_class.test
  end

  desc "Channelをアップデート"
  task update_channels: :environment do
    ChannelUpdater.update_channels_and_categories
  end

  desc "Enumをアップデート"
  task update_enumerations: :environment do
    EnumerationUpdater.update_enumerations_and_category_enumerations
  end

  desc "カテゴリーをアップデート"
  task update_categories: :environment do
    CategoryUpdater.update_categories
  end

  desc "それぞれの動画を収集・カテゴライズ・ニュース生成"
  task update_all_info: :environment do
    puts "creating press"
    history = BacthHistory.create(task_name: :curate_videos)
    video_curator = VideoCurator.new
    video_curator.check_all_channels
    history.update(is_completed: true)

    history = BacthHistory.create(task_name: :categorize_videos)
    video_categorizer = VideoCategorizer.new
    video_categorizer.categorize
    history.update(is_completed: true)

    history = BacthHistory.create(task_name: :create_news)
    press_creator = PressCreator.new
    press_creator.create_news
    history.update(is_completed: true)
    #find_new_video.check_specific_category_channel
  end

  desc "動画を収集・カテゴライズ・ニュース生成"
  task update_each_info: :environment do
    puts "creating press"
    history = BacthHistory.create(task_name: :curate_videos)
    video_curator = VideoCurator.new
    video_curator.check_channels_in_slice
    history.update(is_completed: true)

    history = BacthHistory.create(task_name: :categorize_videos)
    video_categorizer = VideoCategorizer.new
    video_categorizer.categorize_in_slice
    history.update(is_completed: true)

    history = BacthHistory.create(task_name: :create_news)
    press_creator = PressCreator.new
    press_creator.create_news
    history.update(is_completed: true)
    #find_new_video.check_specific_category_channel
  end

  desc "動画を収集"
  task curate_videos: :environment do
    puts "curating video"
    history = BacthHistory.create(task_name: :curate_videos)
    video_curator = VideoCurator.new
    video_curator.check_all_channels
    history.update(is_completed: true)
  end

  desc "動画を1000ごとに収集"
  task curate_videos_in_slice: :environment do
    puts "curating video"
    history = BacthHistory.create(task_name: :curate_videos)
    video_curator = VideoCurator.new
    video_curator.check_channels_in_slice
    history.update(is_completed: true)
  end

  desc "動画をカテゴライズ"
  task categorize_videos: :environment do
    puts "categorizing videos"
    history = BacthHistory.create(task_name: :categorize_videos)
    video_categorizer = VideoCategorizer.new
    video_categorizer.categorize
    history.update(is_completed: true)
    #find_new_video.check_specific_category_channel
  end

  desc "動画を1000ごとにカテゴライズ"
  task categorize_videos_in_slice: :environment do
    puts "categorizing videos"
    history = BacthHistory.create(task_name: :categorize_videos)
    video_categorizer = VideoCategorizer.new
    video_categorizer.categorize_in_slice
    history.update(is_completed: true)
    #find_new_video.check_specific_category_channel
  end

  desc "ニュースを生成"
  task create_news: :environment do
    puts "creating press"
    history = BacthHistory.create(task_name: :create_news)
    press_creator = PressCreator.new
    press_creator.create_news
    history.update(is_completed: true)
    #find_new_video.check_specific_category_channel
  end

  desc "特定のカテゴリーの動画を収集"
  task :curate_videos_of, :category do |task, args|
    puts "Hello, #{args[:category]}!"
    puts "curating video"
    # rake news:"curate_videos_of[game]"　で実行するとなぜかエラーを起こす
    video_curator = VideoCurator.new(category_name:"business")
    video_curator.category_name = "business"
    video_curator.check_specific_category_channels
    #find_new_video.check_specific_category_channel
  end
  
  desc "それぞれのカテゴリーの動画を収集"
  task curate_each_video: :environment do
    puts "curating video"
    Category.all.each do |category|
      video_curator = VideoCurator.new(category_name: category.name)
      video_curator.category_name = category.name
      video_curator.check_specific_category_channels
    end
    #find_new_video.check_specific_category_channel
  end
  
  desc "ゲームのカテゴリーの動画を収集"
  task curate_game_videos: :environment do
    puts "curating game videos"
    #なぜかエラーを起こす
    video_curator = VideoCurator.new(category_name:"game")
    video_curator.category_name = "game"
    video_curator.check_specific_category_channels
    #find_new_video.check_specific_category_channel
  end
  
  desc "文房具のカテゴリーの動画を収集"
  task curate_stationary_videos: :environment do
    puts "curating videos of stationary"
    video_curator = VideoCurator.new(category_name:"stationary")
    video_curator.category_name = "stationary"
    video_curator.check_specific_category_channels
  end

  desc "弁当のカテゴリーの動画を収集"
  task curate_bento_videos: :environment do
    puts "curating videos of bento"
    video_curator = VideoCurator.new(category_name:"bento")
    video_curator.category_name = "bento"
    video_curator.check_specific_category_channels
  end
  
  task recategorize_videos: :environment do
    puts "recategorizing videos"
    videos = Video.where(published_at: (DateTime.now-1)..DateTime.now)
    videos.update_all(categorized_at:nil)
    video_categorizer = VideoCategorizer.new
    video_categorizer.categorize
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
