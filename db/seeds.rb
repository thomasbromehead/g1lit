# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

FlatReview.destroy_all
puts "Destroying flat reviews"
Booking.destroy_all
puts "Destroying bookings"
Flat.destroy_all
puts "Destroying flats"
Message.destroy_all
puts "Deleting messages"
UserReview.destroy_all
puts "Deleting User Reviews of Customers"

20.times do |user|
  name= Faker::Name.first_name
  email= Faker::Internet.email
  password= "azerty"
  avatar = [
  "1.jpg",
  "2.jpg",
  "3.jpg",
  "4.jpg",
  "5.jpg",
  "6.jpg",
  "7.jpg",
  "8.jpg",
  "9.jpg",
  "10.jpg",
  "11.jpg",
  "12.jpg",
  "13.jpg",
  "14.jpg",
  "15.jpg",
  "16.jpg",
  "17.jpg",
  "18.jpg",
  "19.jpg",
  "20.jpg"
]
  q = avatar.sample
  avatar.delete_at(avatar.index(q))
#   user = User.create!(first_name:name, email:email, password:password,remote_photo_ur="")
# end
  user = User.create!(first_name: name, email: email, password: password, avatar_data: "#{q}")
end

  puts "Create Thomas"
 User.create!(first_name:"Thomas", pseudo_g1:"tombrom", email:"test@test.fr", password:"azerty", avatar_data:"IMG-20181020-WA0000.jpg")
  
flats = [
  {
  title: "Charmante maison auvergnate traditionelle",
  description:"A 10 min de Clermont-Ferrand, maison en pierre volcanique, faîtou, 4 chambres, table de ping-pong, piscine etc",
  category:"maison",
  price_per_night:"3",
  street:"13, Nouvialle",
  city:"Narnhac",
  country:"France",
  zip_code:"15230",
  user_id: 1,
  image_data: "fsp5earkizotlmmslfld.jpg, q0aguq3ndti5qgkypbgp.jpg, sm6dse8hdmrhlkotjyrb.jpg, eqomiqawbufisqtiyd1t.jpg, facade.jpg",
  nb_beds: 3
  },
  {title: "Appartement de caractère dans monument historique",
  description: "Joli appartement dans un village Mayennais de charme avec canapé-lit et possibilité d'avoir ma chambresi je ne suis pas présente.",
  category:"appartement",
  price_per_night:"7",
  street:"31 rue du Pavé",
  city:"Craon",
  country:"France",
  zip_code:"53400",
  user_id: 2,
  image_data: "garden4.jpg, chalet4.jpg, cuisine.jpg , bedroom9.jpg, cam.jpg",
  nb_beds: 4
  }, 
  {title:"Terrain avec étang proche de Saint-Etienne",
  description: "Grand terrain plat chez moi. Etang avec petite barque, possibilité de pécher, possibilité de prendre une douche à la maison",
  category:"terrain",
  price_per_night:"2",
  street:"30 rue Gabriel Péri",
  city:"Le Chambon-Feugerolles",
  country:"France",
  zip_code:"42500",
  user_id: 3,
  image_data: "paul-hermann-777999-unsplash.jpg, francesca.jpg, garden.jpg, bedroom2.jpg,bedroom4.jpg, bedroom6.jpg,",
  },
  {title:"Camping-Car sur mon terrain dans le Morbihan",
  description:"Camping-car Peugeot de 2000, m'en sers de temps en temps et est donc en bon état",
  category:"camping-car",
  price_per_night:"3",
  street:"2 Impasse des Chênes",
  city:"Séné",
  country:"France",
  zip_code:"56860",
  user_id: 4,
  image_data: "hanson-lu-481132-unsplash.jpg, outside.jpg, kitchen6.jpg, rober.jpg, sdb1.jpg, rob.jpg, kitchen2.jpg",
  nb_beds:4
  },
  {title:"Caravane dans ma forêt personnelle",
  description:"Située dans les Landes, à Soustons, grande caravane avec auvent, petite piscine etc",category:"caravane",
  price_per_night:"4",
  street:"17 route de Tosse",
  city:"Soustons",
  country:"France",
  zip_code:"40140",
  user_id: 5,
  image_data: "vidar-nordli-mathisen-683072-unsplash.jpg, riccardo-mion-645217-unsplash.jpg,fyf5b8zmlt3nxdyuugng.jpg,
  ",
  nb_beds: 6
  },
  {title:"Chambre dans ma maison à proximité de Toulouse",
  description:"Grande Chambre dans ma maison personnelle à Colomiers, proche de Toulouse. Maison avec piscine, salle  de bains privative, wifi etc. Je peux vous servir un bon ptit dej!",
  category:"maison",
  price_per_night:"3",
  street:"40 allée du Somport",
  city:"Colomiers",
  country:"France",
  zip_code:"31770",
  user_id: 1,
  image_data: "montagne.jpg, kitchen2.jpg, londres.jpg, matograine.jpg, chlqtvgopj4lgxq7q9e4.jpg, terrasse.jpg",
  nb_beds: 1
  },
]

flats.each do |flat|
  puts "----"
  puts "creating a new logement"
  Flat.create!(flat)
  sleep 2
end
