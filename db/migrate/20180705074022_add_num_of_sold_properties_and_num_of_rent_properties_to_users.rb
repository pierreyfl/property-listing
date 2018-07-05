class AddNumOfSoldPropertiesAndNumOfRentPropertiesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :num_of_sold_properties, :integer,	default: 0
    add_column :users, :num_of_rent_properties, :integer,	default: 0
  end
end
