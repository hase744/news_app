class Channel < ApplicationRecord
    has_many :channel_categories, class_name: "ChannelCategory", dependent: :destroy
    has_many :categories,through: :channel_categories
    has_many :videos
    validates :youtube_id, uniqueness: true

    before_validation :save_youtube_id_from_url
    def save_youtube_id_from_url
        if self.url && will_save_change_to_url?
            self.youtube_id = get_youtube_id(self.url)
        end
    end
end
