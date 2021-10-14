class AddCustomisations < ActiveRecord::Migration[6.1]
  def up
    execute "insert into customisations (name, created_at, updated_at) values('background', '0000-00-00 00:00:00', '0000-00-00 00:00:00')"
    execute "insert into customisations (name, created_at, updated_at) values('character1', '0000-00-00 00:00:00', '0000-00-00 00:00:00')"
    execute "insert into customisations (name, created_at, updated_at) values('character2', '0000-00-00 00:00:00', '0000-00-00 00:00:00')"
    execute "insert into customisations (name, created_at, updated_at) values('character3', '0000-00-00 00:00:00', '0000-00-00 00:00:00')"
    execute "insert into customisations (name, created_at, updated_at) values('character4', '0000-00-00 00:00:00', '0000-00-00 00:00:00')"
  end
end
