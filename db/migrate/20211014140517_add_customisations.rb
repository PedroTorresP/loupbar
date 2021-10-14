class AddCustomisations < ActiveRecord::Migration[6.1]
  def up
    execute "insert into customisations (name, created_at, updated_at) values('background', #{DateTime.new}, #{DateTime.new})"
    execute "insert into customisations (name, created_at, updated_at) values('character1', #{DateTime.new}, #{DateTime.new})"
    execute "insert into customisations (name, created_at, updated_at) values('character2', #{DateTime.new}, #{DateTime.new})"
    execute "insert into customisations (name, created_at, updated_at) values('character3', #{DateTime.new}, #{DateTime.new})"
    execute "insert into customisations (name, created_at, updated_at) values('character4', #{DateTime.new}, #{DateTime.new})"
  end
end
