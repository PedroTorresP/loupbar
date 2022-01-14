class AddCommentShop < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :comment_shop, :string
  end
end
