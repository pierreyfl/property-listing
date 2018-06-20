
 agent_id = User.create do |u|
   u.email                 = Faker::Internet.email
   u.fullname              = Faker::Name.name
   u.provider              = 'provider'
   u.uid                   = Faker::Number.number(10)
   u.phone_number          = Faker::PhoneNumber.phone_number
   u.description           = Faker::Lorem.sentence
   u.pin                   = Faker::Number.number(4)
   u.phone_verified        = true
   u.password              = '11223344'
   u.password_confirmation = '11223344'
 end.id
#
# puts "Agent with id #{agent_id} created!, creating properties..." if agent_id
#
 100.times do |i|
   Property.create do |p|
     p.agent_id               = agent_id
     p.name                   = Faker::Lorem.word
     p.type                   = Faker::Number.between(0, 4)
     p.bedrooms               = Faker::Number.between(1, 10)
     p.bathrooms              = Faker::Number.between(1, 4)
     p.parking                = Faker::Number.between(1, 3)
     p.description            = Faker::Lorem.sentence
     p.address                = Faker::Address.full_address
     p.price                  = Faker::Number.between(3990, 9999)
     p.area                   = Faker::Number.between(300, 1500)
     p.availability           = Faker::Number.between(1, 3)
     p.user_id  = 1
   end
   puts "#{i.next} property created..."
 end
#
# Property.reindex


#5.times do |i|
  #Agency.create do |ag|
    #ag.name                   = Faker::Lorem.word
    #ag.location               = Faker::Address.city
    #ag.contact_no             = Faker::PhoneNumber.cell_phone
    #ag.email                   = Faker::Internet.email
    #ag.description            = Faker::Lorem.sentence
    #end
  #puts "#{i.next} agency created..."
  #end
Property.reindex
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# PropertyPackage.create(:name => 'Package 2', :price => 44, :listing_period => 10, :is_standard => true, :listings_amount => 20)
# PropertyPackage.create(:name => 'Package 3', :price => 66, :listing_period => 15, :is_feature => true, :listings_amount => 25)

#
# ClassfiedList.create(:title => "List 1", :price => 35, :time_length => 10)
# ClassfiedList.create(:title => "List 2", :price => 45, :time_length => 11)
# ClassfiedList.create(:title => "List 3", :price => 55, :time_length => 12)
# ClassfiedList.create(:title => "List 4", :price => 65, :time_length => 13)
#Amenity.create(:name => 'amenity 1', :available => true, :property_package_id => 3)
#Amenity.create(:name => 'amenity 2', :available => true, :property_package_id => 3)
#Amenity.create(:name => 'amenity 3', :available => true, :property_package_id => 3)
#Amenity.create(:name => 'amenity 4', :available => true, :property_package_id => 3)
#Amenity.create(:name => 'amenity 5', :available => true, :property_package_id => 3)
