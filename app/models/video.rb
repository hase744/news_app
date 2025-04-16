class Video < ApplicationRecord
  belongs_to :channel
  has_many :video_categories, class_name: "VideoCategory", dependent: :destroy
  has_many :categories, through: :video_categories, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :histories, dependent: :destroy
  validates :youtube_id, uniqueness: true
  delegate :id, to: :channel, prefix: true
  delegate :name, to: :channel, prefix: true
  delegate :youtube_id, to: :channel, prefix: true
  delegate :is_fake, to: :channel

  def savind_hash
    {
    'id' => id, 
    'youtube_id' => youtube_id, 
    'title' => title, 
    'channel_name' => channel_name,
    'channel_url' => channel.url, 
    'channel_id' => channel_id,
    'channel_youtube_id' => channel_youtube_id,
    'total_seconds' => total_seconds,
    'published_at' => published_at, 
    }
  end

  def views_per_published
    total_views/(DateTime.now.to_f - published_at.to_f)
  end

  def decoded_id
    Base64.decode64(self.youtube_id)
      .split('.')
      .last
  end

  def included_words(words)
    words.select { |word| title.index(word) }
  end

  def self.insert_all_filtering_keys(params)
    self.insert_all(params.compact.map{|param|{
      total_views: param['total_views'],
      total_seconds: param['total_seconds'],
      live_status: param['live_status'],
      is_live: param['is_live'],
      youtube_id: param['youtube_id'],
      description: param['description'],
      channel_id: param['channel_id'],
      published_at: param['published_at'],
      title: param['title'],
    }})
  end
end