class Category < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :parent_category, class_name: 'Category', optional: true, foreign_key: 'parent_category_id'
  has_many :channel_categories, class_name: "ChannelCategory", dependent: :destroy
  has_many :channels, through: :channel_categories, dependent: :destroy
  #has_many :videos, through: :channels, dependent: :destroy
  #has_many :potential_videos, through: :video_categories
  has_many :video_categories, class_name: "VideoCategory", dependent: :destroy
  has_many :videos, through: :video_categories
  has_many :child_categories, class_name: 'Category', foreign_key: 'parent_category_id'
  has_many :category_enumerations
  has_many :enumerations, through: :category_enumerations
  has_many :presses
  #has_many :videos, through: :video_categories

  before_validation :set_name
  validates :name, uniqueness:true
  
  def concatenated_enums
    enumerations.map{|enum| enum.words.split(',') }.flatten
  end

  def is_original
    self.user_id.present?
  end

  def set_name
    if user_id.present? && !name.present?
      self.name = SecureRandom.uuid
    end
  end

  scope :normal, -> {
    where(is_default: true)
    .where("start_at < ?", DateTime.now)
  }

  scope :general, -> (user_id){
    where(user_id: [user_id, nil])
    .where("start_at < ?", DateTime.now)
  }
  
  scope :original, -> (user_id){
    where(user_id: user_id)
    .where("start_at < ?", DateTime.now)
  }
  
  def name_words_param
    {
      "category" => name,
      "words" => concatenated_enums,
    }
  end

  def output_hash(press = nil)
    hash = {
      'name' => self.name,
      'japanese_name' => self.japanese_name,
      'is_default' => self.is_default,
      'is_formal' => self.is_formal,
      'is_original' => is_original,
      'emoji' => self.emoji,
      'child_categories' => self.child_categories.pluck(:name),
      'image_url' => self.image_url,
    }
    hash["press"] = press if press.present?
    hash
  end
end
