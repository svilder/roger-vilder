require 'csv'
require 'open-uri'

return if Rails.env.production?

puts "start spreading the news"

AdminUser.destroy_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Work.destroy_all
# for console -->
# Work.create(name:"pulsation", description:"Musée d'art de Tokyo", dimensions:"50 x 50 x 50 cm", year:1975, image:"san_francisco.jpg", category:"Kinetics")

puts "starting to parse"

# Retrieve pre-existing data and push it to the DB
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
  # t.cloud_image = row['cloud_image']
  t.save
  puts "#{t.name}, #{t.dimensions} saved"
end
puts "Now, there are #{Work.count} saved via seed in tha Database"


works = Work.all
works.each do |work|
  picture = Cloudinary::Uploader.upload("#{work.image}")
  puts "image put on Cloudinary"
  url = URI.open(picture["secure_url"])
  p url.class
  work.photo.attach(io: url, filename: work.name, content_type: 'image/jpg')
  p work.photo.attached?
  work.save
  puts "Now, #{work.name} should have a picture"
end


# This was for uploading the 100 local photos to cloudinary and link each one to its instance in DB
# Then we need to link existing cloudinary photo.key to our instances in DB for production
# works = Work.all
# works.each do |work|
#   picture = Cloudinary::Uploader.upload("#{work.local_image}")
#   puts "image put on Cloudinary"
#   url = URI.open(picture["secure_url"])
#   p url.class
#   work.photo.attach(io: url, filename: work.name, content_type: 'image/jpg')
#   p work.photo.attached?
#   work.cloud_image = work.photo.key
#   work.save
#   puts "Now, #{work.name} should have a picture"
# end

# migration pour modifier colonne image en local_image
# migration pour ajouter colonne cloud_image
# remettre dossier images locales
# clear dossier cloudinary
# rejouer la seed
# tester si ça marche en production


puts "New york, neeeeew yooooooork"
