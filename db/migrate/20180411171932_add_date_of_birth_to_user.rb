class AddDateOfBirthToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :date_of_birth, :date
    add_column :users, :interested_location, :string
  end
end
