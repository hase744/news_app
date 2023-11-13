class VideoCategory < ApplicationRecord
  belongs_to :category
  belongs_to :video
  #validates :video_id, uniqueness: { scope: :category_id }
  def self.remove_duplicates
    duplicates = select(:video_id, :category_id)
                 .group(:video_id, :category_id)
                 .having('COUNT(*) > 1')
    
    # 重複しているレコードのうち、最初以外を削除
    duplicates.each do |duplicate|
      records_to_delete = where(video_id: duplicate.video_id, category_id: duplicate.category_id)
      records_to_delete.offset(1).destroy_all
    end
  end
end
