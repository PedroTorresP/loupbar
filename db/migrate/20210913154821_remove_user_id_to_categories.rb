class RemoveUserIdToCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :user_id
  end
end
