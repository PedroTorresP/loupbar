class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :image
      t.decimal :price
      t.integer :places
      t.string :result

      t.timestamps
    end
  end
end
