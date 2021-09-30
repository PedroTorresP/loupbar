class AddToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :shipping, :boolean
    add_column :orders, :payment, :string
  end
end
