class ChannelCategory < ApplicationRecord
    belongs_to :channel
    belongs_to :category
end
