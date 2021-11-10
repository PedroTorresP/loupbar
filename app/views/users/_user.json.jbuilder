json.extract! user, :id, :id, :username, :password, :email, :first_name, :last_name, :postal_code, :city, :address, :phone, :is_admin, :created_at, :updated_at
json.url user_url(user, format: :json)
