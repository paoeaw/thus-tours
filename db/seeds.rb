require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  user = User.new(name: Faker::TvShows::Seinfeld.character, email: Faker::Internet.email, password: '123456')
  tour = Tour.new(name: Faker::Hipster.words(2), details: Faker::TvShows::Seinfeld.quote(2), cost: rand(300), location: Faker::Address.city, provider_id: 1)
  tour_photo_url = "https://picsum.photos/200/300/?random"
  tour.remote_photo_url = tour_photo_url
  tour.save
  user_photo_url = "https://loremflickr.com/320/240"
  user.remote_photo_url = user_photo_url
  user.save
end

puts 'seeded!'
