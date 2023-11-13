class ChannelCategory < ApplicationRecord
  belongs_to :channel
  belongs_to :category

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
end
