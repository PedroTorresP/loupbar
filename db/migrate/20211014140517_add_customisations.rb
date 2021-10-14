class AddCustomisations < ActiveRecord::Migration[6.1]
  def up
    execute "insert into customisations (name, created_at, updated_at) values('background', #{Date.new}, #{Date.new})"
    execute "insert into customisations (name, created_at, updated_at) values('character1', #{Date.new}, #{Date.new})"
    execute "insert into customisations (name, created_at, updated_at) values('character2', #{Date.new}, #{Date.new})"
    execute "insert into customisations (name, created_at, updated_at) values('character3', #{Date.new}, #{Date.new})"
    execute "insert into customisations (name, created_at, updated_at) values('character4', #{Date.new}, #{Date.new})"
  end
end
