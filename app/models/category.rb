class Category < ApplicationRecord
    has_many :channel_categories, class_name: "ChannelCategory", dependent: :destroy
    has_many :channels, through: :channel_categories
    has_many :video_categories, class_name: "VideoCategory", dependent: :destroy
    has_many :videos, through: :video_categories
    has_many :presses

    #validates :name, uniqueness:true
end
