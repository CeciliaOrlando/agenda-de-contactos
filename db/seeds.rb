require 'faker'

categories = %w[customer supplier family friend]

Faker::UniqueGenerator.clear

8.times do |i|
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: 'password1'
  )

  puts "Created user: #{user.email}"

  3.times do
    contact_attributes = {
      full_name: Faker::Name.name,
      nickname: Faker::Internet.username(specifier: 5..8),
      birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.cell_phone,
      emergency_number: Faker::PhoneNumber.phone_number,
      category: categories.sample
    }

    puts "Contact attributes: #{contact_attributes.inspect}"

    contact = user.contacts.create!(contact_attributes)

    address_attributes = {
      city: Faker::Address.city,
      street: Faker::Address.street_address,
      state: Faker::Address.state_abbr,
      postal_code: Faker::Address.zip_code,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude
    }

    puts "Address attributes: #{address_attributes.inspect}"

    contact.create_address!(address_attributes)
  end
end
