class AddTrackingToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :tracking, :string
  end
end
