class User < ApplicationRecord
  has_many :favorites
  has_many :videos, through: :favorites
  has_many :histories
  has_many :videos, through: :histories
end
