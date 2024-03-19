class Video < ApplicationRecord
  belongs_to :channel
  has_many :video_categories, class_name: "VideoCategory", dependent: :destroy
  has_many :categories,through: :video_categories
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
end