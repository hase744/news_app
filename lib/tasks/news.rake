require_relative '../../lib/example_class'
require_relative '../../lib/video_curator'
require_relative '../../lib/video_categorizer'
namespace :news do
  desc "aa" #desc → description（説明）
  task task_name: :environment do #task_nameは自由につけられる
    # 実行したい処理を記述する場所
    example_class = ExampleClass.new
    example_class.test
  end

  desc "動画を収集"
  task curate_videos: :environment do
    puts "curating video"
    video_finder = VideoCurator.new
    video_finder.check_all_channels
    #find_new_video.check_specific_category_channel
  end
  
  task categorize_videos: :environment do
    puts "categorizing videos"
    video_categorizer = VideoCategorizer.new
    video_categorizer.categorize
    #find_new_video.check_specific_category_channel
  end
end
