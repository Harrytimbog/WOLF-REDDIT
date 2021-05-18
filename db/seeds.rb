require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create()

puts 'Creating 10 fake Users...'
10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    username:  Faker::Name.middle_name,
    bio:  Faker::Quotes::Shakespeare.hamlet_quote,
    password: "123456"
  )
  user.save!
end
puts 'Finished Creating Users!'


puts "Creating Fake Communities"
10.times do
  community = Community.new(
    name: Faker::Currency.name,
    url: Faker::Quotes::Shakespeare.hamlet_quote,
    rules: "No sending of money, no spamming and no insults",
    summary: Faker::ChuckNorris.fact,
    user_id: 2
  )
  community.save!
end

puts "Finished creating communities"
