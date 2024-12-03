
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Destroy all existing data to start fresh

Review.destroy_all
Toilet.destroy_all
User.destroy_all

# Create 4 users

users = []
4.times do |i|
  users << User.create!(
    name: "User #{i + 1}",
    username: "user#{i + 1}",
    email: "user#{i + 1}@lol.com",
    password: "password",
    password_confirmation: "password"
  )
end

user1 = User.create!(username: "John Wick", name: "John Wick", email: "user1@example.com", password: "password", password_confirmation: "password")
user2 = User.create!(username: "Jane Doe", name: "Jane Doe", email: "user2@example.com", password: "password", password_confirmation: "password")
user3 = User.create!(username: "Bob Smith", name: "Bob Smith", email: "user3@example.com", password: "password", password_confirmation: "password")
user4 = User.create!(username: "Alice Johnson", name: "Alice Johnson", email: "user4@example.com", password: "password", password_confirmation: "password")


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

# Create toilets and reviews for user1
toilet1 = Toilet.create!(name: spooky_toilets[0], location: "Spooky Address 1, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user1)
toilet1.update!(image_url: "https://res.cloudinary.com/dq57wkefg/image/upload/v1733223103/tumblr_inline_nv2w5ozl4L1ty84t8_1280_1_zwyxqf.webp")
Review.create!(title: "Review for #{toilet1.name}", content: "This is a review for the spooky toilet #{toilet1.name}. It's eerie but functional!", rating: 4, user: user1, toilet: toilet1)

toilet2 = Toilet.create!(name: spooky_toilets[1], location: "Spooky Address 2, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user1)
Review.create!(title: "Review for #{toilet2.name}", content: "This is a review for the spooky toilet #{toilet2.name}. It's eerie but functional!", rating: rand(1..5), user: user1, toilet: toilet2)

toilet3 = Toilet.create!(name: spooky_toilets[2], location: "Spooky Address 3, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user1)
Review.create!(title: "Review for #{toilet3.name}", content: "This is a review for the spooky toilet #{toilet3.name}. It's eerie but functional!", rating: rand(1..5), user: user1, toilet: toilet3)

toilet4 = Toilet.create!(name: spooky_toilets[3], location: "Spooky Address 4, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user1)
Review.create!(title: "Review for #{toilet4.name}", content: "This is a review for the spooky toilet #{toilet4.name}. It's eerie but functional!", rating: rand(1..5), user: user1, toilet: toilet4)

toilet5 = Toilet.create!(name: spooky_toilets[4], location: "Spooky Address 5, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user1)
Review.create!(title: "Review for #{toilet5.name}", content: "This is a review for the spooky toilet #{toilet5.name}. It's eerie but functional!", rating: rand(1..5), user: user1, toilet: toilet5)

# Create toilets and reviews for user2
toilet6 = Toilet.create!(name: spooky_toilets[5], location: "Spooky Address 6, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user2)
Review.create!(title: "Review for #{toilet6.name}", content: "This is a review for the spooky toilet #{toilet6.name}. It's eerie but functional!", rating: rand(1..5), user: user2, toilet: toilet6)

toilet7 = Toilet.create!(name: spooky_toilets[6], location: "Spooky Address 7, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user2)
Review.create!(title: "Review for #{toilet7.name}", content: "This is a review for the spooky toilet #{toilet7.name}. It's eerie but functional!", rating: rand(1..5), user: user2, toilet: toilet7)

toilet8 = Toilet.create!(name: spooky_toilets[7], location: "Spooky Address 8, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user2)
Review.create!(title: "Review for #{toilet8.name}", content: "This is a review for the spooky toilet #{toilet8.name}. It's eerie but functional!", rating: rand(1..5), user: user2, toilet: toilet8)

toilet9 = Toilet.create!(name: spooky_toilets[8], location: "Spooky Address 9, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user2)
Review.create!(title: "Review for #{toilet9.name}", content: "This is a review for the spooky toilet #{toilet9.name}. It's eerie but functional!", rating: rand(1..5), user: user2, toilet: toilet9)

toilet10 = Toilet.create!(name: spooky_toilets[9], location: "Spooky Address 10, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user2)
Review.create!(title: "Review for #{toilet10.name}", content: "This is a review for the spooky toilet #{toilet10.name}. It's eerie but functional!", rating: rand(1..5), user: user2, toilet: toilet10)

# Create toilets and reviews for user3
toilet11 = Toilet.create!(name: spooky_toilets[10], location: "Spooky Address 11, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user3)
Review.create!(title: "Review for #{toilet11.name}", content: "This is a review for the spooky toilet #{toilet11.name}. It's eerie but functional!", rating: rand(1..5), user: user3, toilet: toilet11)

toilet12 = Toilet.create!(name: spooky_toilets[11], location: "Spooky Address 12, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user3)
Review.create!(title: "Review for #{toilet12.name}", content: "This is a review for the spooky toilet #{toilet12.name}. It's eerie but functional!", rating: rand(1..5), user: user3, toilet: toilet12)

toilet13 = Toilet.create!(name: spooky_toilets[12], location: "Spooky Address 13, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user3)
Review.create!(title: "Review for #{toilet13.name}", content: "This is a review for the spooky toilet #{toilet13.name}. It's eerie but functional!", rating: rand(1..5), user: user3, toilet: toilet13)

toilet14 = Toilet.create!(name: spooky_toilets[13], location: "Spooky Address 14, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user3)
Review.create!(title: "Review for #{toilet14.name}", content: "This is a review for the spooky toilet #{toilet14.name}. It's eerie but functional!", rating: rand(1..5), user: user3, toilet: toilet14)

toilet15 = Toilet.create!(name: spooky_toilets[14], location: "Spooky Address 15, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user3)
Review.create!(title: "Review for #{toilet15.name}", content: "This is a review for the spooky toilet #{toilet15.name}. It's eerie but functional!", rating: rand(1..5), user: user3, toilet: toilet15)

# Create toilets and reviews for user4
toilet16 = Toilet.create!(name: spooky_toilets[15], location: "Spooky Address 16, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user4)
Review.create!(title: "Review for #{toilet16.name}", content: "This is a review for the spooky toilet #{toilet16.name}. It's eerie but functional!", rating: rand(1..5), user: user4, toilet: toilet16)

toilet17 = Toilet.create!(name: spooky_toilets[16], location: "Spooky Address 17, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user4)
Review.create!(title: "Review for #{toilet17.name}", content: "This is a review for the spooky toilet #{toilet17.name}. It's eerie but functional!", rating: rand(1..5), user: user4, toilet: toilet17)

toilet18 = Toilet.create!(name: spooky_toilets[17], location: "Spooky Address 18, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user4)
Review.create!(title: "Review for #{toilet18.name}", content: "This is a review for the spooky toilet #{toilet18.name}. It's eerie but functional!", rating: rand(1..5), user: user4, toilet: toilet18)

toilet19 = Toilet.create!(name: spooky_toilets[18], location: "Spooky Address 19, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user4)
Review.create!(title: "Review for #{toilet19.name}", content: "This is a review for the spooky toilet #{toilet19.name}. It's eerie but functional!", rating: rand(1..5), user: user4, toilet: toilet19)

toilet20 = Toilet.create!(name: spooky_toilets[19], location: "Spooky Address 20, Berlin", latitude: 52.5 + rand(-0.05..0.05), longitude: 13.4 + rand(-0.05..0.05), user: user4)
Review.create!(title: "Review for #{toilet20.name}", content: "This is a review for the spooky toilet #{toilet20.name}. It's eerie but functional!", rating: rand(1..5), user: user4, toilet: toilet20)

# Zusätzliche gruselige Reviews mit spezifischen Attributen
additional_review_contents = [
  # 5 female-friendly Reviews (davon 3 mit paid_entry)
  ["Sehr sicherer und sauberer Ort. Perfekt beleuchtet!", true, false, false, true, true, true],
  ["Extra Haken für Taschen und gute Beleuchtung.", true, false, false, true, true, false],
  ["Separate Bereiche für Damen, sehr gepflegt.", true, false, false, true, true, true],
  ["Gut gesichert und hell. Perfekt für späte Stunden.", true, false, false, false, true, false],
  ["Moderne Ausstattung und sehr sicher.", true, false, false, true, true, false],
  # 2 dirty Reviews
  ["Etwas ungepflegt, aber funktional.", false, true, false, false, false, true],
  ["Könnte eine Reinigung vertragen...", false, true, false, false, false, false],

  # 3 clean Reviews
  ["Blitzsauber und gut gewartet!", false, false, true, false, false, true],
  ["Hygienisch einwandfrei!", false, false, true, false, false, true],
  ["Makellos sauber, wie im Hotel.", false, false, true, false, false, false],

  # 5 accessible Reviews
  ["Perfekt für Rollstuhlfahrer geeignet.", false, false, false, false, false, true],
  ["Breite Türen und gute Ausstattung für alle.", false, false, false, false, false, true],
  ["Barrierefrei und gut durchdacht.", false, false, false, false, false, true],
  ["Behindertengerecht mit allen Extras.", false, false, false, false, false, true],
  ["Vorbildliche barrierefreie Einrichtung.", false, false, false, false, false, true],

  # Restliche Reviews ohne spezielle Attribute
  ["Mysteriöse Geräusche, aber funktional.", false, false, false, false, false, false],
  ["Spooky, aber sauber!", false, false, false, false, false, false],
  ["Perfekt für Grusel-Fans.", false, false, false, false, false, false],
  ["Unheimlich gut!", false, false, false, false, false, false],
  ["Gespenstisch schön!", false, false, false, false, false, false]
]

# Zusätzliche Reviews erstellen
toilets = Toilet.all.to_a
users = User.all.to_a

additional_review_contents.each_with_index do |review_data, index|
  content, female_friendly, dirty, clean, paid_entry, accessible, well_located = review_data

  Review.create!(
    title: "Spuk-Review ##{index + 1}",
    content: content,
    rating: rand(3..5),
    user: users.sample,
    toilet: toilets.sample,
    created_at: rand(2.months.ago..Time.now),
    female_friendly: female_friendly,
    dirty: dirty,
    clean: clean,
    paid_entry: paid_entry,
    accessible: accessible,
    well_located: well_located,
    handicap_friendly: [true, false].sample,
    family_friendly: [true, false].sample
  )
end

puts "#{additional_review_contents.length} zusätzliche gruselige Reviews wurden erstellt!"

# Markiere 5 Toiletten als handicap-friendly
toilets = Toilet.all.to_a
toilets.sample(5).each do |toilet|
  toilet.update!(handicap_friendly: true)
end

# Markiere 5 andere Toiletten als family-friendly
remaining_toilets = toilets.reject(&:handicap_friendly)
remaining_toilets.sample(5).each do |toilet|
  toilet.update!(family_friendly: true)
end

# Beispiel für das Hinzufügen von Bildern zu Toiletten
image_urls = [
  "https://res.cloudinary.com/dq57wkefg/image/upload/v1733223103/tumblr_inline_nv2w5ozl4L1ty84t8_1280_1_zwyxqf.webp",
  "https://res.cloudinary.com/dq57wkefg/image/upload/v1733223103/what-a-cool-way-to-make-new-friends-above-a-photo-of-two-toilets-facing-each-other-in-a-bathroom_aawlfu.jpg",
  "https://res.cloudinary.com/dq57wkefg/image/upload/v1733223103/l214t9f0piq51_gs54an.jpg",
  "https://res.cloudinary.com/dq57wkefg/image/upload/v1733223103/funny-urinal-toilets-v0-wo3gkyc0wtpb1_jppztz.webp",
  "https://res.cloudinary.com/dq57wkefg/image/upload/v1733223103/Crazy-Toilet-14_tkwafg.jpg",
  "https://res.cloudinary.com/dq57wkefg/image/upload/v1733223103/images_syknfg.jpg",
  "https://res.cloudinary.com/dq57wkefg/image/upload/v1733223103/funny-urinal-toilets-v0-kd4brxc0wtpb1_cfgclm.webp",
  "https://res.cloudinary.com/dq57wkefg/image/upload/v1733223102/funny-urinal-toilets-v0-5wpgmxc0wtpb1_bupc7p.webp",
  "https://res.cloudinary.com/dq57wkefg/image/upload/v1733223102/funny-bathroom-design-fails-174-5c94fb76745e4__700_fjmhvf.jpg",
  "https://res.cloudinary.com/dq57wkefg/image/upload/v1733223102/Crazy-Toilet-25_jiphuj.jpg",
  "https://res.cloudinary.com/dq57wkefg/image/upload/v1733223102/2056_syjssi.webp",
  "https://res.cloudinary.com/dq57wkefg/image/upload/v1733223101/bb5f41685ab321a47745a62e2aba68ac_irb4sd.jpg"
]

Toilet.all.each_with_index do |toilet, index|
  toilet.update!(image_url: image_urls[index % image_urls.length])
end
