class Video < ApplicationRecord
    belongs_to :channel
    has_many :video_categories, class_name: "VideoCategory", dependent: :destroy
    has_many :categories,through: :video_categories
    has_many :favorites
    validates :youtube_id, uniqueness: true
    delegate :id, to: :channel, prefix: true
    delegate :name, to: :channel, prefix: true
    delegate :youtube_id, to: :channel, prefix: true
end