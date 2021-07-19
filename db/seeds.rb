# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating Users'
10.times do
  user = User.new(
    username: Faker::Creature::Animal.name,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone
  )
  user.save!
  puts "Created user #{user.first_name}"
end

# spaces seed
20.times do
  space = Space.new(
    type: ,
    price: ,
    image_urls: ,
    city: ,
    address: ,
    title:  ,
    description:  ,
    user_id:
  )
  space.save!
  puts "Created space #{space.title}"
end

      # t.string :type
      # t.integer :price
      # t.string :image_urls, array: true, default: []
      # t.string :city
      # t.string :address
      # t.string :title
      # t.text :description
      # t.references :user, null: false, foreign_key: true

# reviews seed (?)

# bookings seed (?)

# puts 'Creating 100 fake restaurants...'
# 100.times do
#   restaurant = Restaurant.new(
#     name:    Faker::Company.name,
#     address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
#     rating:  rand(0..5)
#   )
#   restaurant.save!
# end
# puts 'Finished!'
