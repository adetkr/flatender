# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Flat.delete_all


puts "création de 4 users "

pierre = User.new(name: 'Pierre', email:'pierre@test.com', presentation: "Je vis à Saint-Denis", university: "Le Wagon Saint-Denis", password: "pierre@test.com")
pierre.save!
puts "pierre exist"

ademola = User.new(name: 'Ademola', email:'ademola@test.com', presentation: "je vis au Costa Rica", university: "Le Wagon Costa Rica", password: "ademola@test.com")
pierre.save!
puts "ademola exist"

aline = User.new(name: 'Aline', email:'aline@test.com', presentation: "je vis a Rome", university: "Le Wagon Rome", password: "aline@test.com")
pierre.save!
puts "aline exist"

alex = User.new(name: 'Alex', email:'alex@test.com', presentation: "je vis a Mexico", university: "Le Wagon Mexico", password: "aline@test.com")
pierre.save!
puts "aline exist"

puts "création des 4 appartements "

pierre_home = Flat.new(address: "37 rue Paul-Edouard, 93200 Saint-Denis, France", presentation: "presentation test", rent: 500, user_id: "#{pierre.id}")
pierre_home.save!

puts "pierre_home exist"

ademola_home = Flat.new(address: "Playa Matapalo, Carrillo, Guanacaste Province, Sardinal District, Costa Rica", presentation: "presentation test", rent: 300, user_id: "#{ademola.id}")
ademola_home.save!

puts "ademola_home exist"

aline_home = Flat.new(address: "196, 00138 Roma RM, Italie", presentation: "presentation test", rent: 600, user_id: "#{aline.id}")
aline_home.save!

puts "aline_home exist"

alex_home = Flat.new(address: "Av. 5 de Mayo 61, Centro Histórico de la Cdad. de México, Centro, Cuauhtémoc, 06000 Centro, CDMX, Mexique", presentation: "presentation test", rent: 600, user_id: "#{alex.id}")
alex_home.save!

puts "alex_home exist"
