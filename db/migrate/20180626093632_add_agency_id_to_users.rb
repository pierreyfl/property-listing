class AddAgencyIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :agency_id, :integer
    add_index :users, :agency_id
  end
end
