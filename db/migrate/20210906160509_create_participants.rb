class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :is_paid

      t.timestamps
    end
  end
end
