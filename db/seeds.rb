require "open-uri"
require "nokogiri"

Category.destroy_all
User.destroy_all
Projects.destroy_all

puts "Creating categories..."

html_content = open('https://fr.wikipedia.org/wiki/M%C3%A9tiers_du_b%C3%A2timent#Fumisterie').read
doc = Nokogiri::HTML(html_content)

doc.search('dt').each_with_index do |element, index|
  Category.create!(name: element.text.strip)
end

Category.create!(name: "Isolation")
Category.create!(name: "Plomberie")
Category.create!(name: "Electricité")


puts "Creating users..."
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    zip: (01000..99999).to_a.sample
  )
end

puts "Creating projects..."
10.times do
  Project.create!(
    title: Faker::Hipster.sentence,
    content: Faker::Hipster.paragraph,
    city: Faker::Address.city,
    department: (0..99).to_a.sample,
    category_id: ((Category.first.id)..Category.count).to_a.sample,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample
  )
end
