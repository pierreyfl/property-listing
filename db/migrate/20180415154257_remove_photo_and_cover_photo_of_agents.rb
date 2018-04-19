class RemovePhotoAndCoverPhotoOfAgents < ActiveRecord::Migration[5.1]
  def up
    remove_column :agents, :photo
    remove_column :agents, :cover_photo
  end
  def down
    add_column :agents, :photo, :string
    add_column :agents, :cover_photo, :string
  end
end
