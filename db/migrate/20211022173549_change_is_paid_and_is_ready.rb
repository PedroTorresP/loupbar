class ChangeIsPaidAndIsReady < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :is_ready, :integer
    change_column :orders, :is_paid, :integer
  end
end
