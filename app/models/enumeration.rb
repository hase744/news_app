class Enumeration < ApplicationRecord
  has_many :category_enumerations, dependent: :destroy
  has_many :categories, through: :category_enumerations

  def array
    words.split(',')
  end
end
