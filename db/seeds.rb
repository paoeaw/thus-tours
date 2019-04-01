require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create(name: Faker::Movies::HarryPotter.character, email: Faker::Internet.email, password: '123456')
  tour = Tour.new(name: Faker::Hipster.words(4), details: Faker::Hipster.paragraph(2), cost: rand(300), location: Faker::Address.city, provider_id: 1)
  photo_url = "https://picsum.photos/200/300/?random"
  tour.remote_photo_url = photo_url
  tour.save
end

puts 'seeded!'
