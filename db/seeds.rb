# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.delete_all
Contract.delete_all
FlatMatch.delete_all
Match.delete_all
Like.delete_all
Equipment.delete_all
Flat.all.each(&:destroy)
FlatMatch.delete_all
User.delete_all



puts "-------------------------------"
puts "création de 5 users "



stefan = User.new(name: 'Stefan', email:'stefan@test.com', presentation: "🚀 Engineer graduated from the UTT X NUS, I am a technology enthousiast, always proactive and able to bring innovation within my organization.🚘 Interested in mobility I am actually working on a new EV project with Agile methods within the Procurement division of Renault-Nissan-Mitsubishi Alliance ! I like to decicade my free time to read about business news, learn new way of working, do online training (coding) and last but not least a lot of sports !", university: "université de technologie de paris", password: "stefan@test.com")
stefan.save!
puts "stefan exist"

clement = User.new(name: 'Clément', email:'clement@test.com', presentation: "Project manager in a web agency. Here to code and to become a developer :)", university: "Université Paris Dauphine- PSL", password: "clement@test.com")
clement.save!
puts "clement exist"

fatoutmata = User.new(name: 'Fatoutmata', email:'fatoutmata@test.com', presentation: "Hey my name is Fatou and i'm a digital consultant ( product owner). I would like to learn to code so that I can be more efficient at work the day and work on personal project by night ;)", university: "EDHEC Business school paris", password: "fatoutmata@test.com")
fatoutmata.save!
puts "fatoutmata exist"

caroline = User.new(name: 'Caroline', email:'caroline@test.com', presentation: "I'm currently in charge of communications for a Private Equity Fund. After completing this bootcamp, I would like to start a new career as a web developer.", university: "CELSA - Ecole des hautes études en communication", password: "caroline@test.com")
caroline.save!
puts "caroline exist"

afchine = User.new(name: 'Afchine', email:'afchine@test.com', presentation: "...Marketeux voulant devenir un peu DEV... J'aimerais créer ma boîte après la formation pour créer un service original et fun dans le domaine des jeux en ligne.", university: "Skema Business School", password: "afchine@test.com")
afchine.save!
puts "afchine exist"

celeste = User.new(name: 'Celeste', email:'celeste@test.com', presentation: "Hello, my name is Celeste (but you can call me Cell ^_^) , i live in wonderfull madrid as communcation engineer students. I plan on studying in france next year in the university of St Denis", university: "Universidad Complutense de Madrid", password: "celeste@test.com")
celeste.save!
puts "celeste exist"

pierre = User.new(name: 'Pierre', email:'pierre@test.com', presentation: "Hello, I have been a graphic designer / web designer / artistic director for almost 12 years. My skills range from pure design (webdesign, print graphics, logo, graphic charter, powerpoint presentation) to development (front-end, integration, deployment, drafting of specifications). Today freelance, my profile combines creative abilities with advanced technical know-how. Autonomous and responsive, I work for individuals as well as for companies (from SMEs to large groups).", university: "Le Wagon Saint-Denis", password: "pierre@test.com")
pierre.save!
puts "pierre exist"

ademola = User.new(name: 'Ademola', email:'ademola@test.com', presentation: "I'm currently an actuary, and would like to be able build a web app for any ideas i can have! My plan is to create my own business or switch to freelance as a web developper.", university: "New York University", password: "ademola@test.com")
ademola.save!
puts "ademola exist"

aline = User.new(name: 'Aline', email:'aline@test.com', presentation: "I am an educator specializing in an autism SESSAD and I would like to become a web developer at the end of the training at Le Wagon school.", university: "Tor Vergata University of Rome", password: "aline@test.com")
aline.save!
puts "aline exist"

alex = User.new(name: 'Alex', email:'alex@test.com', presentation: "For the last 10 years I was working as a market manager. I have chosen Le Wagon to learn web development and find a job in the tech industry.", university: "
National Autonomous University of Mexico", password: "alex@test.com@test.com")
alex.save!
puts "alex exist"

camille = User.new(name: 'Camille', email:'camille@test.com', presentation: "Intervening for SMEs and stratups, I help my clients to identify and formalize their digital needs, and to find the means to fulfill their objectives, while taking into account their current communication.", university: "Université de Montpellier", password: "camille@test.com")
camille.save!
puts "camille exist"

alexis = User.new(name: 'Alexis', email:'alexis@test.com', presentation: "Front and back web developer (Swiss Army Knife) I mainly work on global freelance projects for web and communication agencies. In recent years I have been required to work on sites of great importance / large clients (hence the confidentiality note on most of the projects in my profile) which allowed me to evolve on many points and work on both unique and complex projects.", university: "Université du cerveaux")
puts "alexis exist"

basile = User.new(name: 'Basile', email:'basile@test.com', presentation: "In permanent beta : learning, discovering, practicing in tech environment and new technology uses. Still looking for new challenges and be part of a project and a team.", university: "Université de Montpellier", password: "basile@test.com")
basile.save!
puts "basile exist"

puts "-------------------------------"






puts "création des appartements "

pierre_home = Flat.new(surface: 38, rooms: 2, title:"A lovely flat in Paris", address: "16 Villa Gaudelet, Paris 11e Arrondissement, Île-de-France, France", presentation: "Large studio of 30m2 nicely decorated, in a recent building. Only 5 minutes from Robespierre metro on line 9, you are 10 minutes from Nation by metro. It has a large double bed and a convertible sofa. The bathroom is spacious and has a large walk-in shower. The open kitchen faces 2 large bay windows which makes this apartment bright and warm.", rent: 500, user_id: "#{pierre.id}")
pierre_home.save!

ademola_home = Flat.new(surface: 65, rooms: 3, title:"Come and study on the beach", address: "Paseo Colón, Merced, San José, Costa Rica", presentation: "Located in the heart of Manuel Antonio, comfortable, safe and fully equipped with kitchen, one bedroom, one bathroom and spacious living room, supermarket 50 m. Extra services: laundry, yoga classes on the beach, tours to amazing waterfall, and shuttle to the Airport.", rent: 300, user_id: "#{ademola.id}")
ademola_home.save!

aline_home = Flat.new(surface: 25, rooms: 1, title:"You will love studying in Roma", address: "Piazza del Campidoglio, 00186 Roma RM, Italie", presentation: "Rome Vatican Suites 5 a private stanza with a private room inside a B&B of 5 stanze. Situato nel cuore di Roma a due passi da l Vaticano, questa suite vanta infatti a splendid affaction with the cupola di San Pietro. We offer tutti and nostri clients, free of charge, an all-Italian collaboration, available in the common area, to start at the meglio la giornata!", rent: 700, user_id: "#{aline.id}")
aline_home.save!

alex_home = Flat.new(surface: 90, rooms: 4, title:"Come and learn spanish in my lovely city", address: "Miguel Hidalgo, Mexico City, Mexique", presentation: "Abusus enim multitudine hominum, quam tranquillis in rebus diutius rexit, ex agrestibus habitaculis urbes construxit multis opibus firmas et viribus, quarum ad praesens pleraeque licet Graecis nominibus appellentur, quae isdem ad arbitrium inposita sunt conditoris, primigenia tamen nomina non amittunt, quae eis Assyria lingua institutores veteres indiderunt.", rent: 400, user_id: "#{alex.id}")
alex_home.save!

celeste_home = Flat.new(surface: 38, rooms: 2, title:"Apartamento céntrico y bien comunicado", address: "Calle de Quintana, Madrid, Espagne ", presentation:" Central apartment in the Lavapiés neighborhood, ideal for couples who want to discover the most emblematic places of the city on foot. The house is 8 minutes from the Reina Sofía, 3 minutes from the Anton Martin metro station and the market of the same name and 10 minutes from the Atocha Station. Supermarket 24 hours a minute from home.", rent: 550, user_id: "#{celeste.id}")
celeste_home.save!

camille_home = Flat.new(surface: 38, rooms: 2, title:"A lovely flat in Paris", address: "20 Rue du Temple, 75004 Paris", presentation: "The apartment is located close to lively neighborhoods (very close to rue oberkampf, near Parmentier and Bastille) and very well connected (Père Lachaise metro station, three stations from République). I have a fast and unlimited internet connection (fiber), a large bright living room with a small balcony, a separate kitchen, a separate toilet, a large bathroom with a bathtub. I rent a 22m² room with a very comfortable double bed, very quiet with a large window and with plenty of storage space. The building is a classic and chic Parisian style building, the apartment is on the 4th floor with an elevator.", rent: 500, user_id: "#{camille.id}")
camille_home.save!

stefan_home = Flat.new(surface: 38, rooms: 2, title:"Large nicely decorated studio", address: "75020 paris 239 rue des pyrénées", presentation:"Large studio of 30m2 nicely decorated, in a recent building. Only 5 minutes from the Robespierre metro on line 9, you are 10 minutes from Nation by metro. It has a large double bed and a convertible sofa. The bathroom is spacious and has a large walk-in shower.", rent: 550, user_id: "#{stefan.id}")
stefan_home.save!

clement_home = Flat.new(surface: 38, rooms: 2, title:"charming studio on the heights of Belleville", address: "Rue du Télégraphe, 75020 Paris", presentation:"Nice 20m2 studio, close to the Buttes Chaumont park & rue de Belleville, Telegraph metro station (2 minutes walk), shops & bars nearby. Well thought-out storage, cozy atmosphere.
A mezzanine offers a significant saving of space allowing the arrangement of a small living room. A dining table allows you to sit down for a good meal (hotplates, fridge & oven).", rent: 550, user_id: "#{clement.id}")
clement_home.save!

fatoutmata_home = Flat.new(surface: 70, rooms: 4, title:"charming studio on the heights of Belleville", address: "102 Avenue d'Ivry, 75013 Paris", presentation:"Beautiful, cozy Studio 15 min from Chatelet center. 4 minutes from Olympiades metro station and 7 minutes from Maison blanche station. Nearby there is a wide choice of supermarkets, many authentic restaurants. In the Studio, you have: WiFi, refrigerator, microwave, hair dryer ect ... There is the entrance, a kitchen area, WC, comfortable and cozy studio to feel at home.", rent: 1350, user_id: "#{fatoutmata.id}")
fatoutmata_home.save!

caroline_home = Flat.new(surface: 200, rooms: 5, title:"Magnificent Loft Apartment in the Latin Quarter", address: "5 Impasse Mousset, 75012 Paris", presentation:"Sprawl out on a designer sofa encompassed by captivating artwork under coffered ceilings. Boasting a range of stylish furnishings amid unique design elements and decor, this stunning, luxury loft is teeming with chic eclecticism at every corner.", rent: 2000, user_id: "#{caroline.id}")
caroline_home.save!

afchine_home = Flat.new(surface: 80, rooms: 4, title:"Large studio decorated with care - paris 20eme", address: "236 Rue des Pyrénées, 75020 Paris", presentation:"Nice 29sqm studio decorated with care and high in color located between the neighborhood of Ménilmontant and the neighborhood of Charonne close to the cemetery of Père Lachaise. Equipped to accommodate 2 people with a double bed. Wifi, washing machine, fan are also included. Linens and towels will be provided. It should be noted that the check-in time is from 3 pm and the check-out time no later than 11 am. For more…", rent: 1000, user_id: "#{afchine.id}")
afchine_home.save!


basile_home = Flat.new(surface: 50, rooms: 3, title:"3 room apartment with balcony / parking", address: "41 Rue Labrouste, 75015 Paris", presentation:"Beautiful apartment, very bright, located near the Latin Quarter and with parking and a pleasant balcony overlooking a large tree-lined boulevard. It is bathed in light thanks to its large windows that open onto the gardens and the Paris sky. After a long day in the noisy tumult of Parisian life,", rent: 800, user_id: "#{basile.id}")
basile_home.save!



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
<<<<<<< HEAD
puts "création d'un match"
contrat1 = Contract.new(content: 'test', signature:"test", match_id: "#{Match.last.id}")
contrat1.save!
puts "contrat créé"
puts "-------------------------------"
puts "création d'un contrat"
contrat1 = Contract.new(content: 'test', signature:"test", match_id: "#{Match.last.id}")
contrat1.save!
puts "contrat créé"





=======
#puts "création d'un match"
#contrat1 = Contract.new(content: 'test', signature:"test", match_id: "#{Match.last.id}")
#contrat1.save!
#puts "contrat créé"
#puts "-------------------------------"
#puts "création d'un contrat"
#contrat1 = Contract.new(content: 'test', signature:"test", match_id: "#{Match.last.id}")
#contrat1.save!
#puts "contrat créé"
>>>>>>> origin
