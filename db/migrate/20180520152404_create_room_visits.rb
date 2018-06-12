class CreateRoomVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :room_visits do |t|
      t.integer :user_id
      t.string :email
      t.string :ip
      t.integer :time_spent

      t.timestamps
    end
  end
end
