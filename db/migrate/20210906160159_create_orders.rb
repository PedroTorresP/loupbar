class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :discount
      t.integer :is_paid
      t.integer :is_ready
      t.integer :shipping
      t.integer :payment

      t.timestamps
    end
  end
end
