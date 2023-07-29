class VideoCollection
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
            if value['id'].present?
                video = Video.find(value['id'])
                video.total_views = value["total_views"]
                video
            else
                Video.new(
                  id:value['id'],
                  total_views: value["total_views"],
                  second: value["second"],
                  youtube_id: value['youtube_id'],
                  description: value['description'],
                  channel_id: value['channel_id'],
                  published_at: value["published_at"],
                  title: value["title"],
                )
            end
        end
      else
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
      ActiveRecord::Base.transaction do
        collection.each do |result|
          # バリデーションを全てかけたいからsave!ではなくsaveを使用
          is_success = false unless result.save
        end
        # バリデーションエラーがあった時は例外を発生させてロールバックさせる
        raise ActiveRecord::RecordInvalid unless is_success
      end
      rescue => e
        p 'エラー'
        p e
      ensure
        return is_success
    end
  end