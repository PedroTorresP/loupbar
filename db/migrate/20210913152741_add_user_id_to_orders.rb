class AddUserIdToOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :user_id, :integer
    add_index :orders, :user_id
  end
end
