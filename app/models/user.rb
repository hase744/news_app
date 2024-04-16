class User < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :histories, dependent: :destroy
  has_many :categories, dependent: :destroy
end
