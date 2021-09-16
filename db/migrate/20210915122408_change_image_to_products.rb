class ChangeImageToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :image, :attached
  end
end
