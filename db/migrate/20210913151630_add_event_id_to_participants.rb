class AddEventIdToParticipants < ActiveRecord::Migration[6.1]
  def change
    change_column :participants, :event_id, :integer
    add_index :participants, :event_id
  end
end
