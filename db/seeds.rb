require 'csv'
require 'open-uri'

puts "start spreading the news"

AdminUser.destroy_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Work.destroy_all

# Work.create(name:"pulsation", description:"Musée d'art de Tokyo", dimensions:"50 x 50 x 50 cm", year:1975, image:"san_francisco.jpg", category:"Kinetics")
puts "starting to parse"

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

works = Work.all

works.each do |work|
  picture = Cloudinary::Uploader.upload("#{work.image}")
  puts "image put on Cloudinary"
  url =URI.open(picture["secure_url"])
  p url.class
  work.photo.attach(io: url, filename: 'some-image.jpg', content_type: 'image/jpg')
  p work.photo.attached?
  work.save
  puts "Now, #{work.name} should have a picture"
end



puts "New york, neeeeew yooooooork"
