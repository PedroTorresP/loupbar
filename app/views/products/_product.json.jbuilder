json.extract! product, :id, :id, :name, :category, :description, :price, :image_path, :quantity, :min_stock, :available, :created_at, :updated_at
json.url product_url(product, format: :json)
