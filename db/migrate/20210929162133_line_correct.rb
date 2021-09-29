class LineCorrect < ActiveRecord::Migration[6.1]
  def change
    drop_table :line_items
    create_table :line_items do |t|
      t.integer  "quantity",   default: 1
      t.integer  "product_id"
      t.integer  "cart_id"
      t.integer  "order_id"
      t.timestamps
    end
  end
end
