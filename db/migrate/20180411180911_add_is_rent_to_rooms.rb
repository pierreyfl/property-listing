class AddIsRentToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :is_rent, :boolean
  end
end
