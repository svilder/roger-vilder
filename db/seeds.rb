require 'csv'
require 'open-uri'

#add environment safe clause

Work.destroy_all

puts 'Generate Works seed data'
csv_text = File.read(Rails.root.join('db','works.csv'))
csv = CSV.parse(csv_text, :headers => true)

csv.each do |work|

  model = Work.new(
    name: work["name"],
    description: work["description"],
    dimensions: work["dimensions"],
    year: work["year"],
    image: work["image"],
    video_key: work["video_key"],
    display_option: work["display_option"],
    collection: work['collection'],
  )
  
  if model.valid?
    p model
    p 'is valid'
    model.save
  else
    p "error: #{model.errors.messages}"
  end

end
puts "#{Work.count} Works has been seeded"