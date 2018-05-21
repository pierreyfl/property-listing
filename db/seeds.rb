user = User.new({
  email: Faker::Internet.email,
  fullname: Faker::Name.name,
  provider: 'sample',
  uid: '7777777',
  phone_number: Faker::PhoneNumber.phone_number,
  description: Faker::Lorem.sentence,
  pin: 'bb3333',
  phone_verified: true,
  password: '12345678',
  password_confirmation: '12345678'
})

user.save!

15.times do |i|
  bed_rooms = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  bath_rooms =  [1, 2, 3, 4, 5, 6, 7, 8, 9]
  property_types =  [1, 2, 3, 4, 5, 6, 7, 8, 9]
  true_or_false = [true, false]
  prices = [50000, 75000, 100000, 125000, 150000, 175000, 200000, 225000, 250000]

  Room.create!({
    home_type: property_types.sample,
    room_type: 'Private',
    accommodate: 1,
    bed_room: bed_rooms.sample,
    bath_room: bath_rooms.sample,
    listing_name: Faker::Lorem.word,
    summary: Faker::Lorem.sentence,
    address: Faker::Address.street_address,
    is_tv: true_or_false.sample,
    is_kitchen: true_or_false.sample,
    is_air: true_or_false.sample,
    is_heating: true_or_false.sample,
    is_internet: true_or_false.sample,
    price: prices.sample,
    active: true,
    user: user
  })
end

Room.reindex

Amenity.create(:name => 'amenity 1', :available => true, :property_package_id => 3)
Amenity.create(:name => 'amenity 2', :available => true, :property_package_id => 3)
Amenity.create(:name => 'amenity 3', :available => true, :property_package_id => 3)
Amenity.create(:name => 'amenity 4', :available => true, :property_package_id => 3)
Amenity.create(:name => 'amenity 5', :available => true, :property_package_id => 3)
