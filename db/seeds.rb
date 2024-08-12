# db/seeds.rb

require 'faker'

categories = %w[customer supplier family friend]

# Create 8 users
8.times do |i|
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "user#{i+1}@example.com",
    password: 'password1' # Ensure this is at least 6 characters
  )

  # Create 3 contacts per user with random categories
  3.times do
    contact = user.contacts.create!(
      full_name: Faker::Name.name,
      nickname: Faker::Internet.username(specifier: 5..8),
      birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.cell_phone,
      emergency_number: Faker::PhoneNumber.phone_number,
      category: categories.sample, # Randomly select a category
    )

    # Create an address for each contact
    contact.create_address!(
      city: Faker::Address.city,
      street: Faker::Address.street_address,
      state: Faker::Address.state_abbr,
      postal_code: Faker::Address.zip_code,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude
    )
  end
end


