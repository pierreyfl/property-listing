class AddUserableIdAndUserableTypeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :userable_id, :integer
    add_column :users, :userable_type, :string
  end
end
