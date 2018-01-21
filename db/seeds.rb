# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do
  username = Faker::Ancient.god
  email = Faker::Internet.email
  password = 'qwerty'
  User.create!(username: username, email: email, password: password)
end

30.times do
  user_id = rand(1..7)
  title = Faker::Pokemon.name
  body = Faker::HarryPotter.quote
  Note.create!(title: title, body: body, user_id: user_id)
end
