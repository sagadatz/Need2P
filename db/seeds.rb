# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Toilet.destroy_all
User.destroy_all

# Create 4 users
users = []
4.times do |i|
  users << User.create!(
    email: "user#{i + 1}@example.com",
    password: "password",
    password_confirmation: "password"
  )
end

# Create 20 toilets
20.times do |i|
  Toilet.create!(
    name: "Toilet #{i + 1}",
    #description: "This is a description of Toilet #{i + 1}.",
    address: "Krausnickstraße 1, 10115 Berlin",
    #Use geocoder for lng lat!
    user: users.sample                  # Randomly assign a user as the owner
  )
end

puts "Seeded #{User.count} users and #{Toilet.count} toilets!"
