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

room = Room.new({
  home_type: '1',
  room_type: 'Private',
  accommodate: 1,
  bed_room: 2,
  bath_room: 1,
  listing_name: 'Nice bed room with attached bathroom',
  summary: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  address: 'Cecilia Chapman 711-2880 Nulla St. Mankato Mississippi 96522 (257) 563-7401',
  is_tv: true,
  is_kitchen: false,
  is_air: true,
  is_heating: true,
  is_internet: true,
  price: 1500,
  active: true,
  user: user
})

room.save!

Room.reindex
