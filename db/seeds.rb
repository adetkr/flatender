# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Flat.delete_all


puts "pierre user"

pierre = User.new(name: 'Pierre Claude', email:'pierre@test.com', presentation: "Bogoss Blond au yeux bleus", university: "Le Wagon Saint-Denis", password: "pierre@test.com")
pierre.save!

puts "pierre exist"

puts "pierre Home"
pierre_home = Flat.new(address: "37 rue Paul-Edouard, 93200 Saint-Denis", presentation: "presentation test", rent: 500, user_id: "#{pierre.id}")
pierre_home.save!

puts "pierre_home exist"
