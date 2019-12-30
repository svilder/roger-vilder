# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'open-uri'

puts "start spreading the news"

# AdminUser.destroy_all

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Work.destroy_all

# Work.create(name:"pulsation", description:"Musée d'art de Tokyo", dimensions:"50 x 50 x 50 cm", year:1975, image:"san_francisco.jpg", category:"Kinetics")
puts "starting to parse"

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'toutes_les_pieces_de_ta_vie.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   t = Work.new
#   t.name = row['name']
#   t.description = row['description']
#   t.dimensions = row['dimensions']
#   t.year = row['year']
#   t.image = row['image']
#   t.youtube_link = row['youtube_link']
#   t.category = row['category']
#   t.collection = row['collection']
#   t.save
#   puts "#{t.name}, #{t.dimensions} saved"
# end

# puts "Now, there are #{Work.count} saved via seed in tha Database"


p "on uri"
file = URI.open('https://res.cloudinary.com/dfbhkicfg/image/upload/v1577704699/nzjsf8mibhewfumcqmyi.jpg')
work = Work.new(name: "toto")
p "on attache"
p work.photo
p attache = work.photo.attach(io: file, filename: 'some-image.jpg', content_type: 'image/jpg')
# Here we write article.photo.attach(...) because we wrote has_one_attached :photo in app/models article.rb
work.save
p work.photo.attached?

# works = Work.all

# works.each do |work|
#   picture = Cloudinary::Uploader.upload("#{work.image}")
#   puts "Now, Cloudinary is filled with my local images, eh, eh, eh"
#   url = picture["secure_url"]
#   p url
#   p url.class
#   work.photo.attach(io: url, filename: 'some-image.jpg', content_type: 'image/jpg')
#   p work.name
#   work.save
#   puts "Now, I saved cloudinary photo.key"
# end



puts "New york, neeeeew yooooooork"
