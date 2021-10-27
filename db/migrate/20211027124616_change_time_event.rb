class ChangeTimeEvent < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :time, :time
  end
end
