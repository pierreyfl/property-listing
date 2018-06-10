class AddUserToProperty < ActiveRecord::Migration[5.1]
  def change
    add_reference :properties, :user, foreign_key: true
  end
end
