class AddOrderIdToBuys < ActiveRecord::Migration[6.1]
  def change
    change_column :buys, :order_id, :integer
    add_index :buys, :order_id
  end
end
