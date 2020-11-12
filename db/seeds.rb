# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.delete_all
Contract.delete_all
Match.delete_all
Like.delete_all
Equipment.delete_all
Flat.all.each(&:destroy)
FlatMatch.delete_all
User.delete_all



puts "-------------------------------"
puts "création de 5 users "

celeste = User.new(name: 'Celeste', email:'celeste@test.com', presentation: "Hello, my name is Celeste (but you can call me Cell ^_^) , i live in wonderfull madrid as communcation engineer students. I plan on studying in france next year in the university of St Denis", university: "Universidad Complutense de Madrid", password: "celeste@test.com")
celeste.save!
puts "celeste exist"



pierre = User.new(name: 'Pierre', email:'pierre@test.com', presentation: "Hae duae provinciae bello quondam piratico catervis mixtae praedonum a Servilio pro consule missae sub iugum factae sunt vectigales. et hae quidem regiones velut in prominenti terrarum lingua positae ob orbe eoo monte Amano disparantur.", university: "Le Wagon Saint-Denis", password: "pierre@test.com")
pierre.save!
puts "pierre exist"

ademola = User.new(name: 'Ademola', email:'ademola@test.com', presentation: "Et est admodum mirum videre plebem innumeram mentibus ardore quodam infuso cum dimicationum curulium eventu pendentem. haec similiaque memorabile nihil vel serium agi Romae permittunt. ergo redeundum ad textum.", university: "Le Wagon Costa Rica", password: "ademola@test.com")
ademola.save!
puts "ademola exist"

aline = User.new(name: 'Aline', email:'aline@test.com', presentation: "Ego vero sic intellego, Patres conscripti, nos hoc tempore in provinciis decernendis perpetuae pacis habere oportere rationem. Nam quis hoc non sentit omnia alia esse nobis vacua ab omni periculo atque etiam suspicione belli?", university: "Le Wagon Rome", password: "aline@test.com")
aline.save!
puts "aline exist"

alex = User.new(name: 'Alex', email:'alex@test.com', presentation: "je vis a Mexico", university: "Quam ob rem id primum videamus, si placet, quatenus amor in amicitia progredi debeat. Numne, si Coriolanus habuit amicos, ferre contra patriam arma illi cum Coriolano debuerunt? num Vecellinum amici regnum adpetentem, num Maelium debuerunt iuvare?", password: "aline@test.com")
alex.save!
puts "alex exist"

puts "-------------------------------"
puts "création des 5 appartements "

pierre_home = Flat.new(surface: 38, rooms: 2, title:"A lovely flat in Paris", address: "16 Villa Gaudelet, Paris 11e Arrondissement, Île-de-France, France", presentation: "Ut enim benefici liberalesque sumus, non ut exigamus gratiam (neque enim beneficium faeneramur sed natura propensi ad liberalitatem sumus), sic amicitiam non spe mercedis adducti sed quod omnis eius fructus in ipso amore inest, expetendam putamus.", rent: 500, user_id: "#{pierre.id}")
pierre_home.save!

puts "pierre_home exist"

ademola_home = Flat.new(surface: 65, rooms: 3, title:"Come and study on the beach", address: "Paseo Colón, Merced, San José, Costa Rica", presentation: "Utque aegrum corpus quassari etiam levibus solet offensis, ita animus eius angustus et tener, quicquid increpuisset, ad salutis suae dispendium existimans factum aut cogitatum, insontium caedibus fecit victoriam luctuosam.", rent: 300, user_id: "#{ademola.id}")
ademola_home.save!

puts "ademola_home exist"

aline_home = Flat.new(surface: 25, rooms: 1, title:"You will love studying in Roma", address: "Piazza del Campidoglio, 00186 Roma RM, Italie", presentation: "Et est admodum mirum videre plebem innumeram mentibus ardore quodam infuso cum dimicationum curulium eventu pendentem. haec similiaque memorabile nihil vel serium agi Romae permittunt. ergo redeundum ad textum.", rent: 600, user_id: "#{aline.id}")
aline_home.save!

puts "aline_home exist"

alex_home = Flat.new(surface: 90, rooms: 4, title:"Come and learn spanish in my lovely city", address: "Miguel Hidalgo, Mexico City, Mexique", presentation: "Abusus enim multitudine hominum, quam tranquillis in rebus diutius rexit, ex agrestibus habitaculis urbes construxit multis opibus firmas et viribus, quarum ad praesens pleraeque licet Graecis nominibus appellentur, quae isdem ad arbitrium inposita sunt conditoris, primigenia tamen nomina non amittunt, quae eis Assyria lingua institutores veteres indiderunt.", rent: 600, user_id: "#{alex.id}")
alex_home.save!


celeste_home = Flat.new(surface: 38, rooms: 2, title:"Apartamento céntrico y bien comunicado", address: "Calle de Quintana, Madrid, Espagne", presentation: "Apartamento céntrico en el barrio de Lavapiés, ideal para parejas que quieran conocer andando los sitios mas emblemáticos de la ciudad. La casa se encuentra a 8 minutos del Reina Sofía, a 3 minutos de la parada de metro Anton Martin y del mercado del mismo nombre y a 10 minutos de la Estación de Atocha. Supermercado 24 horas a un minuto de casa.", rent: 600, user_id: "#{celeste.id}")
celeste_home.save!


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
Equipment.create(name: "air-conditioning")
Equipment.create(name: "degree")
Equipment.create(name: "dishwashers")
Equipment.create(name: "dryer")
Equipment.create(name: "freezer")
Equipment.create(name: "hair-dryer")
Equipment.create(name: "iron")
Equipment.create(name: "key")
Equipment.create(name: "laundry")
Equipment.create(name: "microwave")
Equipment.create(name: "parking")
Equipment.create(name: "pets")
Equipment.create(name: "refrigerator")
Equipment.create(name: "shower")
Equipment.create(name: "soundproof")
Equipment.create(name: "swiming-pool")
Equipment.create(name: "terrace")
Equipment.create(name: "user")
Equipment.create(name: "washing-machine")
Equipment.create(name: "weekly-cleaning")
Equipment.create(name: "wifi")
puts "equipements créés"
puts "equipements créés"
puts "-------------------------------"
puts "création d'un match"
contrat1 = Contract.new(content: 'test', signature:"test", match_id: "#{Match.last.id}")
contrat1.save!
puts "contrat créé"
puts "-------------------------------"
puts "création d'un contrat"
contrat1 = Contract.new(content: 'test', signature:"test", match_id: "#{Match.last.id}")
contrat1.save!
puts "contrat créé"





