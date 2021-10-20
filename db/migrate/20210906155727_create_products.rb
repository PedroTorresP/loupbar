class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.string :image_path
      t.integer :quantity
      t.integer :min_stock
      t.boolean :available
      t.integer :subcategory_id

      t.timestamps
    end
  end
end
