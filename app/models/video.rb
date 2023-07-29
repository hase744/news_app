class Video < ApplicationRecord
    belongs_to :channel
    has_many :video_categories, class_name: "VideoCategory", dependent: :destroy
    has_many :categories,through: :video_categories
end
