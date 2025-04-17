class ChannelUpdater
  BRANCH = Rails.env.production? ? 'main' : Rails.env.downcase
  CHANNELS_URL = Rails.application.credentials.news_app_constants_path + "/#{BRANCH}/data/channels.json"

  def self.update_channels_and_categories
    channels_json = URI.open(CHANNELS_URL).read
    channels_array = JSON.parse(channels_json)

    update_channels(channels_array)
    update_channel_categories(channels_array)
  end

  def self.update_channels(channels_array)
    existing_urls = Channel.pluck(:url)
    new_channels = channels_array.reject { |entry| existing_urls.include?(entry['url']) }
                                 .map { |entry| { url: entry['url'] } }
    new_channels = Parallel.map(new_channels){|channel|
    #new_channels = new_channels.map{|channel|
      puts "url: #{channel[:url]}"
      channel_model = Channel.new(url: channel[:url])
      channel_model.set_detail
      channel[:youtube_id] = channel_model.youtube_id
      channel[:url] = channel_model.url
      channel[:name] = channel_model.name
      channel[:image_url] = channel_model.image_url
      channel[:name] = channel_model.name
      channel
    }
    Channel.insert_all(new_channels) unless new_channels.empty?
  end

  def self.update_channel_categories(channels_array)
    # カテゴリの名前をすべて取得
    category_names = channels_array.flat_map { |entry| entry['categories'].split }.uniq

    # 全カテゴリの最新情報を再取得
    category_map = Category.where(name: category_names).pluck(:name, :id).to_h
    channel_map = Channel.where(url: channels_array.map { |entry| entry['url'] }).pluck(:url, :id).to_h

    # チャンネルとカテゴリの対応を構築
    channel_category_pairs = []

    channels_array.each do |entry|
      channel_id = channel_map[entry['url']]
      next unless channel_id

      categories = entry['categories'].split
      absolute_categories = entry['absolute']&.split || []
      if categories.length == 1
        absolute_categories << categories[0] 
        categories = []
      end
      categories.each do |cat_name|
        category_id = category_map[cat_name]
        next unless category_id

        channel_category_pairs << {
          channel_id: channel_id,
          category_id: category_id,
          is_absolute: false
        }
      end
      absolute_categories.each do |cat_name|
        category_id = category_map[cat_name]
        next unless category_id

        channel_category_pairs << {
          channel_id: channel_id,
          category_id: category_id,
          is_absolute: true
        }
      end
    end

    # 既存のChannelCategoryとの重複を除く
    existing_channel_categories = ChannelCategory.where(
      channel_id: channel_category_pairs.map { |h| h[:channel_id] },
      category_id: channel_category_pairs.map { |h| h[:category_id] },
    ).pluck(:channel_id, :category_id, :id, :is_absolute)
      .map { |channel_id, category_id, id, is_absolute|
        {
          channel_id: channel_id,
          category_id: category_id,
          id: id,
          is_absolute: is_absolute
        }
      }.to_set

    new_channel_categories = channel_category_pairs.reject do |pair|
      existing_channel_categories.any? { |ep| ep[:channel_id] == pair[:channel_id] && ep[:category_id] == pair[:category_id] }
    end

    deleting_channel_categories = existing_channel_categories.reject do |category|
      channel_category_pairs.any? { |pair| pair[:channel_id] == category[:channel_id] && pair[:category_id] == category[:category_id] }
    end

    existing_channel_categories = existing_channel_categories.map{|category|
      channel_category_pair = channel_category_pairs.find{|pair| 
        pair[:channel_id] == category[:channel_id] && pair[:category_id] == category[:category_id]
      }
      next if channel_category_pair.nil?
      category[:is_absolute] = channel_category_pair[:is_absolute]
      category
    }.compact

    ChannelCategory.delete(deleting_channel_categories.pluck(:id)) unless deleting_channel_categories.empty?
    ChannelCategory.upsert_all(existing_channel_categories) unless existing_channel_categories.empty?
    ChannelCategory.insert_all(new_channel_categories) unless new_channel_categories.empty?
  end
end
