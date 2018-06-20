class AddAmenitiesMaskToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :amenities, :integer
  end
end
