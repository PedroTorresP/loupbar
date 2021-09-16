class AddUserIdToParticipants < ActiveRecord::Migration[6.1]
  def change
    delete_column :participants, :user_id, :integer
    delete_index :participants, :user_id
  end
end
