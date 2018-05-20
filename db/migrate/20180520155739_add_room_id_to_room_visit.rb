class AddRoomIdToRoomVisit < ActiveRecord::Migration[5.1]
  def change
    add_column :room_visits, :room_id, :integer
  end
end
