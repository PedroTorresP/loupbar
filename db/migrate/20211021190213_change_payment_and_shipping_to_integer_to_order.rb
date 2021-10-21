class ChangePaymentAndShippingToIntegerToOrder < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :payment, :integer
    change_column :orders, :shipping, :integer
  end
end
