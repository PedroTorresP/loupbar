class Product < ApplicationRecord
    belongs_to :category
    belongs_to :subcategory
    has_one_attached :image
    has_many :wishlists
    
    def self.to_csv
        p "calling ---------------------------"
        attributes = %w{id title price image_link description link availability condition brand quantity_to_sell_on_facebook fb_product_category}
        CSV.generate(headers: true) do |csv|
            csv << attributes
            all.each do |product|
                link = 'https://www.leloupbar.ch/boutique/produit?id=' + product.id.to_s
                if product.quantity > 0
                    availability = 'in stock'
                elsif product.quantity < 0 && product.available
                    availability = 'available for order'
                else
                    availability = 'out of stock'
                end
                condition = 'new'

                if product.image.service_url == nil
                    image = 'https://www.leloupbar.ch/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBblVDIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--7dd0c0488da38ba2b5e1857ac0ee344b33f0c43c/leloupbar_vectorized.png'
                else
                    image = product.image.service_url
                end

                if product.description.size <= 0
                    description = product.name.capitalize
                else
                    description = product.description.capitalize
                end

                if availability != 'out of stock'
                csv << [product.id, product.name, product.price, image, description, link, availability, condition, product.category.name, product.quantity, 'toys & games']
                end
            end
        end
    end
end
