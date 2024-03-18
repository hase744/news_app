class ChannelCategory < ApplicationRecord
  belongs_to :channel
  belongs_to :category
  after_create :update_video_category

  validates :channel_id, uniqueness: { scope: :category_id }

  def self.remove_duplicates
    duplicates = select(:channel_id, :category_id)
                 .group(:channel_id, :category_id)
                 .having('COUNT(*) > 1')
    
    # 重複しているレコードのうち、最初以外を削除
    duplicates.each do |duplicate|
      records_to_delete = where(channel_id: duplicate.channel_id, category_id: duplicate.category_id)
      records_to_delete.offset(1).destroy_all
    end
  end

  def update_video_category
    category_words_param = category.name_words_param
    video_category_params = channel.videos.map do |video|
      included_words = video.included_words(category_words_param["words"])
      categorized_video_category_param(included_words, video)
    end.compact
    VideoCategory.upsert_all(video_category_params) if video_category_params.present?
  end

  def categorized_video_category_param(words, video)
    if is_absolute
      {video_id: video.id, category_id: category.id, words: nil}
    elsif words.length > 0
      puts "#{video.title}を#{category.name}にカテゴライズ"
      {video_id: video.id, category_id: category.id, words: words.join(',')}
    else
      nil
    end
  end

  def delegate_video_categories
    video_categories = channel.video_categories.where(category: category)
    video_categories.destroy_all
  end
end
