# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PropertyPackage.create(:name => 'Package 2', :price => 44, :listing_period => 10, :is_standard => true, :listings_amount => 20)
PropertyPackage.create(:name => 'Package 3', :price => 66, :listing_period => 15, :is_feature => true, :listings_amount => 25)

#
# ClassfiedList.create(:title => "List 1", :price => 35, :time_length => 10)
# ClassfiedList.create(:title => "List 2", :price => 45, :time_length => 11)
# ClassfiedList.create(:title => "List 3", :price => 55, :time_length => 12)
# ClassfiedList.create(:title => "List 4", :price => 65, :time_length => 13)
