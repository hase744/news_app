class VideoCategory < ApplicationRecord
    belongs_to :category
    belongs_to :video
    validates :video_id, uniqueness: { scope: :category_id }
end
