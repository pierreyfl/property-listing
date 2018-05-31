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

puts "Agent with id #{agent_id} created!, creating properties..." if agent_id

10.times do |i|
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
    p.availability           = Faker::Number.between(1, 3)
  end
  puts "#{i.next} created..."
end

Property.reindex
