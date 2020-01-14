require 'csv'
require 'open-uri'

categorie = ["Collection publiques et privées", "Expositions personelles", "Expositions collectives"]



puts "Seed Start"

Bibliography.destroy_all

puts "Parsing exhibitions"
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
  puts " #{t.id} (#{t.valid?}), has been seeded "
  unless t.valid?
    puts "#{t.errors.messages}t."
  end
end
puts " #{Exhibition.count} exhibitions parsed!"


puts " Destroying EVERYTHING ( in developpement :) )"

if Rails.env.development?
  AdminUser.destroy_all
  Work.destroy_all
  Bibliography.destroy_all
  Text.destroy_all

  puts "Cleaning done"

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

  puts "Creating 5 fake Bibliographies"

  5.times do
    biblio = Bibliography.create!({
      author: "Restany Pierre",
      title:  "Le Plastique dans l’Art",
      year: 1974,
      month: "Janvier",
    })
  end

  puts "Bibliographies done"

  # puts "Creating 15 fake Exhibitions"

  # 15.times do
  #   exhib = Exhibition.create!({
  #     title: "Exposition Roger-Vilder",
  #     year: 1996,
  #     place: "Fine Art Museum Kingston",
  #     city: "Ontario",
  #     category: categorie.sample,
  #   })
  # end
  # puts "Exhibitions done"

  puts "Creating 5 fakes texts (EN/FR)"
  5.times do
    text = Text.create!({
      author: "Sandra Lastar",
      year: 1966,
      title_fr: "Les lignes du monde",
      title_en: "Lign of the worldeuh",
      content_fr:"...le plaisir esthétique lié aux formes et aux couleurs s'accompagne d'un sens des forces en jeu dans l'univers. Et l'être humain a de cela un besoin profond. Il a autant besoin de communication avec l'univers que de communication sociale. Et c'est sans doute le fondement le plus profond de l'art: le mouvement (d'un animal), le vol (d'une bande d'oiseaux migrateurs), la courbe (d'une vague), le jaillissement (d'un éclair) – ces évènements qui éveillent le désir de faire quelque chose de semblable, d'être, pour ainsi dire, un peu à la hauteur du cosmos. Sans cette communication, sans ce contact, sans cette sensation, il pourrait y avoir,bien sûr «art» et «culture». Mais, passant par des artefacts de plus en plus artificiels, cet «art», cette «culture» aboutissent fatalement à la fantaisie la plus creuse quand ce n'est pas à la complaisance dans la laideur et l'insignifiance. Tous les grands artistes ont toujours su cela. C'est pour cela que Rimbaud dit n'avoir de goût que pour «la terre et les pierres», que Saint-JohnPerse évoquela mer «exemplaire du plus grand texte», et qu'Artaud appelle de ses vœux «une idée organique de la culture». C'est dans ce champ de prémisse, à la fois radical et rayonnant, que, de toute évidence, se situe l'art de Roger Vilder.",
      content_en:"Departing from the classical constructivist’s morphology and syntax, Roger Vilder’s vision has developed without complex nor constrainst to the liking of an all oriental sensuality. It is through the temporary terms of the geometrical langage that he undertakes to shout out his love of life and communicating this to us. « I am a powerless god because I do not accept my own weaknesses » he tells us in a text written in Montreal in February 1970. This recognition is a whole program in itself. This « son of the mediteranean sea and sun » has gone to live the great northern experience and the wideopen spaces. Without emphasizing the sentimental side of all biographical reference, there is something else than a simple hazard to his personal migration though time and space in geography and history. If Vilder resorts to geometric forms, it is because he intends to reach depths, to express the essence of life through its constant metamorphosis. His animated reliefs showing the relentless crossing of two perpandicular lines expresses one Mondrian and all the Mondrian of the world. Life is the squaring of the circle and Vilder knows well that computer design has solved the problem. On the formal plan, and uniquely on this one of course, because the secret of life, which is also that of the magical wand, is the eternal comeback, etrnal beginning, eternal starting over ‘ab ovo’. This eternal starting over of life is not a miracal but a reason to live. In a recent film scenario (October 1972) Roger Vilder describes the extreme amplitude of an elementary metamorphosis. A cluster of dots inscribed in a perfect square, becomes birds flying in an amboid cloud shape, which becomes a school of fish swimming, becoming a herd of sheep running around, seen from above, which turns back to the initial dots within the square. Here, the spirit of geometry identifies itself with a deep instinct apprehending primary elements of existence. My meeting with Roger Vilder was quick, simple, decisive. I beleive in the simple tenacity of this sorcerer without miracles, at his crazy love of life, at his mystical realism and all that he bears within him of instinct that he expresses spontaneously : the kind of people are rare, they do not bother themselves with formal contingencies of the already seen or done and obstinately look at the world with constantly renewed eyes.",
    })
  end
  puts "Texts done"
end




  # if Rails.env.development?
  #   works = Work.all
  #   works.each do |work|
  #     picture = Cloudinary::Uploader.upload("#{work.image}")
  #     puts "image put on Cloudinary"
  #     url = URI.open(picture["secure_url"])
  #     p url.class
  #     work.photo.attach(io: url, filename: work.name, content_type: 'image/jpg')
  #     p work.photo.attached?
  #     work.save
  #     puts "Now, #{work.name} should have a picture"
  #   end
  # end

  # for console -->
  # Work.create(name:"pulsation", description:"Musée d'art de Tokyo", dimensions:"50 x 50 x 50 cm", year:1975, image:"san_francisco.jpg", category:"Kinetics")


puts " Seed done ✌️"
