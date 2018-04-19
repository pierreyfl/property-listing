class AddPhotoAndCoverPhotoToAgents < ActiveRecord::Migration[5.1]
  def up
    add_attachment :agents, :photo
    add_attachment :agents, :cover_photo
  end

  def down
    remove_attachment :agents, :photo
    remove_attachment :agents, :cover_photo
  end
end
