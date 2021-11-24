class AddCustomisationsMore < ActiveRecord::Migration[6.1]
  def change
    execute "insert into customisations (name, value, created_at, updated_at) values('row_color', 'white', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into customisations (name, created_at, updated_at) values('logo', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into customisations (name, created_at, updated_at) values('menu_logo', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into customisations (name, value, created_at, updated_at) values('header_color', 'white', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into customisations (name, created_at, updated_at) values('home_welcome', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
  end
end
