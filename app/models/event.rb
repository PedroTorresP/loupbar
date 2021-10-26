class Event < ApplicationRecord
    has_many :participants
    has_one_attached :image
    has_one_attached :result
end
