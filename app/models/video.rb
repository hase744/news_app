class Video < ApplicationRecord
    belongs_to :channel
    has_many :video_categories, class_name: "VideoCategory", dependent: :destroy
    has_many :categories,through: :video_categories
    has_many :favorites
    validates :youtube_id, uniqueness: true

    def channel_name
        self.channel.name
    end
    
    def channel_id
        self.channel.id
    end
end
