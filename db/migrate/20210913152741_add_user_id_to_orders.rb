class AddUserIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_index :orders, :user_id
  end
end
