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
      puts "channel['youtube_id'] #{channel[:youtube_id]}"
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

      entry['categories'].split.each do |cat_name|
        category_id = category_map[cat_name]
        next unless category_id

        channel_category_pairs << {
          channel_id: channel_id,
          category_id: category_id
        }
      end
    end

    # 既存のChannelCategoryとの重複を除く
    existing_pairs = ChannelCategory.where(
      channel_id: channel_category_pairs.map { |h| h[:channel_id] },
      category_id: channel_category_pairs.map { |h| h[:category_id] }
    ).pluck(:channel_id, :category_id).to_set

    new_channel_categories = channel_category_pairs.reject do |pair|
      existing_pairs.include?([pair[:channel_id], pair[:category_id]])
    end


    ChannelCategory.insert_all(new_channel_categories) unless new_channel_categories.empty?
  end
end
