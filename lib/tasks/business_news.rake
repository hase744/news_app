require_relative '../../lib/example_class'
require_relative '../../lib/video_curator'
require_relative '../../lib/video_categorizer'
namespace :business_news do
  desc "aa" #desc → description（説明）
  task task_name: :environment do #task_nameは自由につけられる
    # 実行したい処理を記述する場所
    example_class = ExampleClass.new
    example_class.test
  end

  desc "ビジネス系の動画の新作を保存"
  task curate_videos: :environment do
    puts "curating videos of business"
    video_finder = VideoCurator.new(category_name:"business")
    video_finder.category_name = "business"
    video_finder.check_specific_category_channelszw
  end
end
