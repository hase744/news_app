class Video < ApplicationRecord
    belongs_to :channel
    has_many :video_categories, class_name: "VideoCategory", dependent: :destroy
    has_many :categories,through: :video_categories
    validates :youtube_id, uniqueness: true

    before_validation :set_default_values

    def set_default_values
        self.is_categorized = false
    end
end
