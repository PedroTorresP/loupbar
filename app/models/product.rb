class Product < ApplicationRecord
    belongs_to :category
    belongs_to :subcategory
    has_one_attached :image
    has_many :wishlists
end
