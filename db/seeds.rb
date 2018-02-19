require "open-uri"
require "nokogiri"

puts "Creating categories..."

html_content = open('https://fr.wikipedia.org/wiki/M%C3%A9tiers_du_b%C3%A2timent#Fumisterie').read
doc = Nokogiri::HTML(html_content)

doc.search('dt').each_with_index do |element, index|
  Category.create!(name: element.text.strip)
end

Category.create!(name: "Isolation")
Category.create!(name: "Plomberie")
Category.create!(name: "Electricité")
Category.create!(name: "Isolation")
