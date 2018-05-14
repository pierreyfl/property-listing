class CreateAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :amenities do |t|
      t.string :name
      t.boolean :available
      t.integer :property_package_id

      t.timestamps
    end
  end
end
