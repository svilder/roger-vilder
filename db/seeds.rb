# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts "start spreading the news"

AdminUser.destroy_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


# Work.create(name:"pulsation", description:"Musée d'art de Tokyo", dimensions:"50 x 50 x 50 cm", year:1975, image:"san_francisco.jpg", category:"Kinetics")


csv_text = File.read(Rails.root.join('lib', 'seeds', 'toutes_les_pieces_de_ta_vie.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Work.new
  t.name = row['name']
  t.description = row['description']
  t.dimensions = row['dimensions']
  t.year = row['year']
  t.image = row['image']
  t.upload_photo = row['upload_photo']
  t.youtube_link = row['youtube_link']
  t.category = row['category']
  t.collection = row['collection']
  t.save
  puts "#{t.name}, #{t.dimensions} saved"
end

puts "Now, there are #{Work.count} saved via seed in tha Database"



raise
works = Work.all

# works.each do |work|
#   Cloudinary::Uploader.upload("#{work.image}")
# end

puts "Now, Cloudinary is filled with my local images, eh, eh, eh"

puts "New york, neeeeew yooooooork"
