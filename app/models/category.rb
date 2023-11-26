class Category < ApplicationRecord
    belongs_to :parent_category, class_name: 'Category', optional: true, foreign_key: 'parent_category_id'
    has_many :channel_categories, class_name: "ChannelCategory", dependent: :destroy
    has_many :channels, through: :channel_categories
    has_many :video_categories, class_name: "VideoCategory", dependent: :destroy
    has_many :sub_categories, class_name: 'Category', foreign_key: 'parent_category_id'
    has_many :videos, through: :video_categories
    has_many :category_enumerations
    has_many :enumerations, through: :category_enumerations
    has_many :presses
    validates :is_default, presence: true

    #validates :name, uniqueness:true
end
