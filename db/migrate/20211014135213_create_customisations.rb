class CreateCustomisations < ActiveRecord::Migration[6.1]
  def change
    create_table :customisations do |t|
      t.string :name
      t.string :image
      t.string :value

      t.timestamps
    end
  end
end
