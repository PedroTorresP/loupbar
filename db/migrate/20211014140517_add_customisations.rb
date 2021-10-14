class AddCustomisations < ActiveRecord::Migration[6.1]
  def up
    execute "insert into customisations (name, created_at, updated_at) values('background', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into customisations (name, created_at, updated_at) values('character1', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into customisations (name, created_at, updated_at) values('character2', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into customisations (name, created_at, updated_at) values('character3', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
    execute "insert into customisations (name, created_at, updated_at) values('character4', '2021-09-13 16:07:50.905390000 +0000', '2021-09-13 16:07:50.905390000 +0000')"
  end
end
