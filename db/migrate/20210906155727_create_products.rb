class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    drop_table :products
    create_table :products do |t|
      t.string :name
      t.integer :category
      t.string :description
      t.decimal :price
      t.string :image_path
      t.integer :quantity
      t.integer :min_stock
      t.boolean :available

      t.timestamps
    end
  end
end
