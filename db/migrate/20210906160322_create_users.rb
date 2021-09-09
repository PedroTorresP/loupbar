class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :postal_code
      t.string :address
      t.boolean :is_admin

      t.timestamps
    end
  end
end
