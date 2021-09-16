class ChangeImageToEvents < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :image, :attached
  end
end
