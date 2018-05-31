class AddFieldsToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :bedrooms, :integer
    add_column :properties, :bathrooms, :integer
    add_column :properties, :description, :text
    add_column :properties, :parking, :integer
    add_column :properties, :address, :string
    add_column :properties, :type, :integer
    add_column :properties, :longitude, :float
    add_column :properties, :latitude, :float
    add_column :properties, :availability, :integer
    add_column :properties, :price, :decimal
  end
end
