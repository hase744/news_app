class VideoCategoryCollection
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  VIDEO_NUM = 2  # 同時にユーザーを作成する数
  attr_accessor :collection
  
  # 初期化メソッド
  def initialize(attributes = [])
    if attributes.present?
      self.collection = attributes.map do |value|
          VideoCategory.new(
              video_id:value['video_id'],
              category_id:value['category_id'],
              word:value['word'],
          )
      end
    else
      puts "attributesなし"
      #self.collection = VIDEO_NUM.times.map{ Video.new }
    end
  end
  
  # レコードが存在するか確認するメソッド
  def persisted?
    false
  end
  
  # コレクションをDBに保存するメソッド
  def save
    is_success = true
    if collection.present?
      ActiveRecord::Base.transaction do
        collection.each do |result|
          # バリデーションを全てかけたいからsave!ではなくsaveを使用
          is_success = false unless result.save
        end
        # バリデーションエラーがあった時は例外を発生させてロールバックさせる
        raise ActiveRecord::RecordInvalid unless is_success
      end
    else
      puts "カテゴライズする動画なし"
    end
      rescue => e
        p 'エラー'
        p e
      ensure
      return is_success
  end
end