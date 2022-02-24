class Homecustomisation < ActiveRecord::Migration[6.1]
  def change
    execute "insert into customisations (name, created_at, updated_at) values('home_information', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into customisations (name, created_at, updated_at) values('image_shop_1', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into customisations (name, created_at, updated_at) values('image_shop_2', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into customisations (name, created_at, updated_at) values('image_shop_3', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into customisations (name, created_at, updated_at) values('image_shop_4', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into customisations (name, created_at, updated_at) values('image_shop_5', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"

  end
end
