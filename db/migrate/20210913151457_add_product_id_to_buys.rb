class AddProductIdToBuys < ActiveRecord::Migration[6.1]
  def change
    change_column :buys, :product_id, :integer
    add_index :buys, :product_id
  end
end
