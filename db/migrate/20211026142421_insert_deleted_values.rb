class InsertDeletedValues < ActiveRecord::Migration[6.1]
  def change
    execute "insert into categories (name, created_at, updated_at) values('autres', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into subcategories (name, created_at, updated_at) values('autres', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into products (name, description, price, quantity, category_id, subcategory_id, date, created_at, updated_at) values('supprimé','supprimé',0,0,1,1,'2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into events (name, description, price, places, date, created_at, updated_at) values('supprimé','supprimé',0,0,'2000-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into users (username, password, email, first_name, last_name,postal_code,address,is_admin, created_at, updated_at) values('admin','password','adminloupbar@yopmail.com','admin','admin',' ',' ',true, '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
  end
end
