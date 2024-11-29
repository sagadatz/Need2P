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

# Spooky toilet names
spooky_toilets = [
  "The Haunted Loo",
  "Phantom's Porcelain Throne",
  "Cryptic Commode",
  "The Cursed Closet",
  "Specter's Stall",
  "Ectoplasm Escape",
  "The Shadowy Seat",
  "Poltergeist Potty",
  "The Howling Hole",
  "Wraith's Washroom",
  "The Ghoul's Grotto",
  "Sinister Sinkhole",
  "The Bone-Chilling Basin",
  "Zombie's Lavatory",
  "The Bewitched Bidet",
  "Spine-Tingling Stall",
  "The Apparition's Alcove",
  "The Macabre Latrine",
  "The Paranormal Powder Room",
  "The Forbidden Flush"
]

# Create toilets with associations
spooky_toilets.each_with_index do |toilet_name, i|
  new_toilet = Toilet.create!(
    name: toilet_name,
    location: "Spooky Address #{i + 1}, Berlin",
    latitude: 52.5 + rand(-0.05..0.05),  # Random latitude near Berlin
    longitude: 13.4 + rand(-0.05..0.05), # Random longitude near Berlin
    user: users.sample                  # Randomly assign a user as the owner
  )
end


puts "Seeded #{User.count} users, #{Toilet.count} spooky toilet."
