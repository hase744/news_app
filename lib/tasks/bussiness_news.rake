require_relative '../../lib/example_class'
require_relative '../../lib/video_saver'
namespace :bussiness_news do
  desc "aa" #desc → description（説明）
  task task_name: :environment do #task_nameは自由につけられる
    # 実行したい処理を記述する場所
    example_class = ExampleClass.new
    example_class.test
  end

  desc "ビジネス系の動画の新作を保存"
  task add_new_video: :environment do
    puts "Hello World"
    find_new_video = VideoSaver.new(category_name:"business")
    find_new_video.category_name = "business"
    #puts find_new_video.category_name
    find_new_video.check_specific_category_channels
    #find_new_video.check_specific_category_channel
    #Find_Business_Video.get_video
    #Find_Business_Video.check_channel
  end
end
