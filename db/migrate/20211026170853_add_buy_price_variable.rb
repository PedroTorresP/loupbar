class AddBuyPriceVariable < ActiveRecord::Migration[6.1]
  def change
    add_column :buys, :price, :decimal
  end
end
