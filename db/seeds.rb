require "open-uri"
require "nokogiri"

Review.destroy_all
Application.destroy_all
Project.destroy_all
Category.destroy_all
User.destroy_all

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
    lastname: Faker::Name.last_name
  )
end


louis = User.create!({:email => "louis@gmail.com", :password => "aaaaaa", :password_confirmation => "aaaaaa", :firstname => "louis", :lastname => "Delon"})
alex = User.create!({:email => "hello@gmail.com", :password => "aaaaaa", :password_confirmation => "aaaaaa", :firstname => "alex", :lastname => "Bouvier"})


puts "Creating projects..."
10.times do
  Project.create!(
    title: Faker::Hipster.sentence,
    content: Faker::Hipster.paragraph,
    city: Faker::Address.city,
    category_id: ((Category.first.id)..(Category.last.id)).to_a.sample,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample
  )
end

project = Project.create!({:title => "projet de louis",
                 :content => "je fais un test",
                 :city => "lyon",
                 :category_id => ((Category.first.id)..(Category.last.id)).to_a.sample,
                 :user => louis
                 })


puts "Creating application..."
20.times do
  Application.create!(
    quote: (100..1000).to_a.sample,
    estimated_duration: (100..1000).to_a.sample,
    start_date: Date.today,
    comment: Faker::Hipster.paragraph,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample,
    project_id: ((Project.first.id)..(Project.last.id)).to_a.sample
  )
end

Application.create!(
    quote: (100..1000).to_a.sample,
    estimated_duration: (100..1000).to_a.sample,
    start_date: Date.today,
    comment: "c'est pour tester",
    user_id: alex.id,
    project_id: project.id,
  )

Application.create!(
  quote: (100..1000).to_a.sample,
  estimated_duration: (100..1000).to_a.sample,
  start_date: Date.today,
  comment: Faker::Hipster.paragraph,
  user_id: ((User.first.id)..(User.last.id)).to_a.sample,
  project_id: ((Project.first.id)..(Project.last.id)).to_a.sample,
  selected: true
)

puts "Creating reviews..."
20.times do
  Review.create!(
    rating: (1..5).to_a.sample,
    content: "c'était super",
    category_id: ((Category.first.id)..(Category.last.id)).to_a.sample,
    destinator_id: ((User.first.id)..(User.last.id)).to_a.sample,
    creator_id: ((User.first.id)..(User.last.id)).to_a.sample
  )
end
