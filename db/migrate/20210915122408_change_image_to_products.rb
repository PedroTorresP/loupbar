class ChangeImageToProducts < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :image, :attached
  end
end
