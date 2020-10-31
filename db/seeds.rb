# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Like.delete_all
Equipment.delete_all
Flat.delete_all
User.delete_all


puts "-------------------------------"
puts "création de 4 users "

pierre = User.new(name: 'Pierre', email:'pierre@test.com', presentation: "Je vis à Saint-Denis", university: "Le Wagon Saint-Denis", password: "pierre@test.com")
pierre.save!
puts "pierre exist"

ademola = User.new(name: 'Ademola', email:'ademola@test.com', presentation: "je vis au Costa Rica", university: "Le Wagon Costa Rica", password: "ademola@test.com")
ademola.save!
puts "ademola exist"

aline = User.new(name: 'Aline', email:'aline@test.com', presentation: "je vis a Rome", university: "Le Wagon Rome", password: "aline@test.com")
aline.save!
puts "aline exist"

alex = User.new(name: 'Alex', email:'alex@test.com', presentation: "je vis a Mexico", university: "Le Wagon Mexico", password: "aline@test.com")
alex.save!
puts "alex exist"

puts "-------------------------------"
puts "création des 4 appartements "

pierre_home = Flat.new(title:"A lovely flat in Paris", address: "16 Villa Gaudelet, Paris", presentation: "presentation test", rent: 500, user_id: "#{pierre.id}")
pierre_home.save!

puts "pierre_home exist"

ademola_home = Flat.new(title:"Come and study on the beach", address: "Paseo Colón, Merced, San José, Costa Rica", presentation: "presentation test", rent: 300, user_id: "#{ademola.id}")
ademola_home.save!

puts "ademola_home exist"

aline_home = Flat.new(title:"You will love studying in Roma", address: "Piazza del Campidoglio, 00186 Roma RM, Italie", presentation: "presentation test", rent: 600, user_id: "#{aline.id}")
aline_home.save!

puts "aline_home exist"

alex_home = Flat.new(title:"Come and learn spanish in my lovely city", address: "Miguel Hidalgo, Mexico City, Mexique", presentation: "presentation test", rent: 600, user_id: "#{alex.id}")
alex_home.save!

puts "alex_home exist"

puts "-------------------------------"
puts "création de likes sans match "
pierrelikeademola = Like.new(user_id: "#{pierre.id}", flat_id: "#{ademola_home.id}")
pierrelikeademola.save!
alexlikealine = Like.new(user_id: "#{alex.id}", flat_id: "#{aline_home.id}")
alexlikealine.save!
puts "likes sans match créés"
puts "-------------------------------"
puts "création de likes avec match "
alinelikespierre = Like.new(user_id: "#{aline.id}", flat_id: "#{pierre_home.id}")
alinelikespierre.save!
pierrelikesaline = Like.new(user_id: "#{pierre.id}", flat_id: "#{aline_home.id}")
pierrelikesaline.save!
alinelikesademola = Like.new(user_id: "#{aline.id}", flat_id: "#{ademola_home.id}")
alinelikesademola.save!
ademolalikesaline = Like.new(user_id: "#{ademola.id}", flat_id: "#{aline_home.id}")
ademolalikesaline.save!
puts "likes avec match créés"
puts "-------------------------------"
puts "création d'équipements"
wifi = Equipment.new(name: "Wi-Fi")
desk = Equipment.new(name: "Desk")
microwave = Equipment.new(name: "Microwave")
iron = Equipment.new(name: "Iron")
desk = Equipment.new(name: "Desk")
coffeemachine = Equipment.new(name: "Coffee-machine")
puts "equipements créés"






