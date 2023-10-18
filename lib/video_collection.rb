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
              puts "既存 : #{value['id']}"
                video = value['model']
                video.total_views = value["total_views"]
                video
            else
                Video.new(
                  total_views: value['total_views'],
                  total_seconds: value['total_seconds'],
                  live_status: value['live_status'],
                  is_live: value['is_live'],
                  youtube_id: value['youtube_id'],
                  description: value['description'],
                  channel_id: value['channel_id'],
                  published_at: value['published_at'],
                  title: value['title'],
                )
            end
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
    #def save
    #  is_success = true
    #  if collection.present?
    #    ActiveRecord::Base.transaction do
    #      collection.each do |result|
    #        # バリデーションを全てかけたいからsave!ではなくsaveを使用
    #        is_success = false unless result.save
    #      end
    #      # バリデーションエラーがあった時は例外を発生させてロールバックさせる
    #      raise ActiveRecord::RecordInvalid unless is_success
    #    end
    #  else
    #    puts "保存する動画なし"
    #  end
    #    rescue => e
    #      p 'エラー'
    #      p e
    #    ensure
    #    return is_success
    #end
    
    def save
      saved_models = [] # 保存に成功したモデルの配列
  
      if collection.present?
        ActiveRecord::Base.transaction do
          collection.each do |result|
            begin
              # バリデーションを全てかけたいからsave!ではなくsaveを使用
              result.save!
              saved_models << result # 保存に成功したモデルを配列に追加
            rescue ActiveRecord::RecordInvalid => e
              result.categories.each do |category|
                p category.name
              end
              p e
              # バリデーションエラーがあった場合、エラーをキャッチして何もしない
            end
          end
        end
      else
        puts "保存する動画なし"
      end
  
      saved_models # 保存に成功したモデルの配列を返す
    end
  end