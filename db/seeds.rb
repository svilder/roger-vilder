require_relative 'seed/work_seed.rb'
require_relative 'seed/text_seed.rb'
require_relative 'seed/exhibition_seed.rb'
require_relative 'seed/bibliography_seed.rb'
require 'csv'
require 'open-uri'

MODELS = %w[Work Text Exhibition Bibliography]

strip = lambda {|f| f ? f.strip : nil}

if Rails.env.development?
  AdminUser.destroy_all
  puts "Creating an admin user for testing active admin"
  admin = AdminUser.new(email: "supertoto@gmail.com", password: "grostoto")
  admin.save

  MODELS.each do |model|
    puts "#{model.pluralize} cleaning"
    model.constantize.destroy_all
    puts "Generating #{model} data"

    csv_text = File.read(Rails.root.join('lib',"seeds/#{model.underscore.pluralize}.csv"))
    csv = CSV.parse(csv_text, headers: true, converters: strip)

    "#{model}Seed".constantize.new(csv).call
    
    puts "#{model.constantize.count} #{model.pluralize} has been seeded"
  end
end