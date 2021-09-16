class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :discount
      t.boolean :is_paid
      t.boolean :is_ready

      t.timestamps
    end
  end
end
