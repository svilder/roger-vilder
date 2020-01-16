require 'csv'
require 'open-uri'

puts "Seed Start"


puts "Parsing exhibitions"

categorie = ["Collection publiques et privées", "Expositions personelles", "Expositions collectives"]
Exhibition.destroy_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Exhibitions.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Exhibition.new
  t.title = row['title']
  t.place = row['place']
  t.city = row['city']
  t.category = row['category']
  t.year = row['year']
  t.associates = row['associates']
  t.save
  puts " #{t.id}, has been seeded "
  unless t.valid?
    puts "#{t.errors.messages}t."
  end
end
puts " #{Exhibition.count} exhibitions parsed!"



# ---------------------------- DONT REMOVE WHATS BELOW----------------------------

if Rails.env.development?
  puts " Destroying EVERYTHING ( in developpement :) )"
  AdminUser.destroy_all
  Work.destroy_all
  Bibliography.destroy_all
  Text.destroy_all

  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

  puts "starting to parse CSV for works"

  csv_text = File.read(Rails.root.join('lib', 'seeds', 'toutes_les_pieces_de_ta_vie.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  csv.each do |row|
    t = Work.new
    t.name = row['name']
    t.description = row['description']
    t.dimensions = row['dimensions']
    t.year = row['year']
    t.image = row['image']
    t.youtube_link = row['youtube_link']
    t.category = row['category']
    t.collection = row['collection']
    t.save
    puts "#{t.name}, #{t.dimensions} saved"
  end

  puts "Now, there are #{Work.count} saved via seed in tha Database"
end

  # for console -->
  # Work.create(name:"pulsation", description:"Musée d'art de Tokyo", dimensions:"50 x 50 x 50 cm", year:1975, image:"san_francisco.jpg", category:"Kinetics")


puts " Seed done ✌️"
