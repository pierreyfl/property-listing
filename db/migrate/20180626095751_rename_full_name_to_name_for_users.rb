class RenameFullNameToNameForUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :fullname, :name
  end
end
