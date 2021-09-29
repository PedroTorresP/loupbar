class AddDateToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :date, :date
  end
end
