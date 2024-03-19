class Category < ApplicationRecord
  belongs_to :parent_category, class_name: 'Category', optional: true, foreign_key: 'parent_category_id'
  has_many :channel_categories, class_name: "ChannelCategory", dependent: :destroy
  has_many :channels, through: :channel_categories
  has_many :video_categories, class_name: "VideoCategory", dependent: :destroy
  has_many :child_categories, class_name: 'Category', foreign_key: 'parent_category_id'
  has_many :videos, through: :video_categories
  has_many :category_enumerations
  has_many :enumerations, through: :category_enumerations
  has_many :presses
  #validates :name, uniqueness:true
  def concatenated_enums
    enumerations.map{|enum| enum.words.split(',') }.flatten
  end

  scope :normal, -> {
    where(is_default: true)
    .where("start_at < ?", DateTime.now)
  }
  
  def name_words_param
    {
      "category" => name,
      "words" => concatenated_enums,
    }
  end
end
