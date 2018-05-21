class AddCoverPhotoToAgencies < ActiveRecord::Migration[5.1]
  def up
    add_attachment :agencies, :cover_photo
  end

  def down
    remove_attachment :agencies, :cover_photo
  end
end
