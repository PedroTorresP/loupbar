class AddFooterCustomisation < ActiveRecord::Migration[6.1]
  def change
    execute "insert into customisations (name, created_at, updated_at) values('footer_color', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
  end
end
