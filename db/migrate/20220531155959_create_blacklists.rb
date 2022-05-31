class CreateBlacklists < ActiveRecord::Migration[6.1]
  def change
    create_table :blacklists do |t|
      t.string :ip

      t.timestamps
    end
  end
end
