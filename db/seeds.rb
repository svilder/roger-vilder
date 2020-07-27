require 'csv'
require 'open-uri'

# ---------------------------- DONT REMOVE WHATS BELOW----------------------------

if Rails.env.development?
  puts " Destroying EVERYTHING ( in developpement :) )"
  AdminUser.destroy_all
  Work.destroy_all
  Text.destroy_all
  Exhibition.destroy_all
  Bibliography.destroy_all
  puts "Seed Developpement Start"
  puts "Parsing exhibitions"
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'Exhibitions.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  csv.each do |row|
    t = Exhibition.new
    t.title = row['title']
    t.place = row['place']
    t.city = row['city']
    t.display_option = row['display_option']
    t.year = row['year']
    t.associates = row['associates']
    t.save
    unless t.valid?
      puts " #{t.id} #{t.errors.messages}t."
    end
    puts " #{t.id}, #{t.place} has been seeded "
  end
  puts "Parsing bibliographies"
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'bibliographies.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  csv.each do |row|
    t = Bibliography.new
    t.author = row['author']
    t.title = row['title']
    t.year = row['year']
    t.month = row['month']
    t.save
    unless t.valid?
      puts "#{t.errors.messages}t."
    end
    puts " #{t.id}, #{t.author} has been seeded "
  end
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
    t.video_key = row['video_key']
    t.display_option = row['display_option']
    t.collection = row['collection']
    t.save
    puts "#{t.name}, #{t.dimensions} saved"
  end
  puts "Now, there are #{Work.count} saved via seed in tha Database"
  puts " Seed done ✌️"
end

puts "Error! No db:seed in Production Environnement, risk of loosing data, pictures of cloudinary"

