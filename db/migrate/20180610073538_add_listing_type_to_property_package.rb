class AddListingTypeToPropertyPackage < ActiveRecord::Migration[5.1]
  def change
    add_column :property_packages, :listing_type, :string
  end
end
