class AddSubcategoryToProduct < ActiveRecord::Migration[6.1]
  def change
    add_index :products, :subcategory_id
  end
end
