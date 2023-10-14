class User < ApplicationRecord
  has_many :favorites
  has_many :videos, through: :favorites
end
