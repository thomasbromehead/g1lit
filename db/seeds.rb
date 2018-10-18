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

# 5.times do |user|
#   name= Faker::Name.first_name
#   email= Faker::Internet.email
#   password= "azerty"
#   avatar = [
#   "v1535031104/wzc0oxydmi1amxe1jrgn",
#   "v1535031090/imnp46lcvho5yvp52ego",
#   "v1535031083/b4x373nholhrwv4iuf8t",
#   "v1535031078/ujaavlhmwxjkdbtkxlgb",
#   "v1535031071/ze1nsklu52qfltscqnpc"]
#   q = avatar.sample
#   avatar.delete_at(avatar.index(q))
# #   user = User.create!(first_name:name, email:email, password:password,remote_photo_ur="")
# # end
#   user = User.create!(name: name, email: email, password: password, remote_photo_url: "https://res.cloudinary.com/ehrsatz/image/upload/#{q}")
  
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
  image_data: "fsp5earkizotlmmslfld.jpg, q0aguq3ndti5qgkypbgp.jpg, sm6dse8hdmrhlkotjyrb.jpg, eqomiqawbufisqtiyd1t.jpg, facade.jpg"
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
  image_data: "garden4.jpg, chalet4.jpg, cuisine.jpg , bedroom9.jpg, cam.jpg"
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
  image_data: ["https://res.cloudinary.com/dsmlpg8oe/image/upload/v1539421635/francesca.jpg", "https://res.cloudinary.com/dsmlpg8oe/image/upload/v1539421635/garden.jpg","https://res.cloudinary.com/dsmlpg8oe/image/upload/v1539421630/bedroom2.jpg", 
  "https://res.cloudinary.com/dsmlpg8oe/image/upload/v1539421630/bedroom4.jpg
  ", 
  "https://res.cloudinary.com/dsmlpg8oe/image/upload/v1539421627/bedroom6.jpg"]
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
  image_data: "outside.jpg, kitchen6.jpg, rober.jpg, sdb1.jpg, rob.jpg, kitchen2.jpg"
  },
  {title:"Caravane dans ma forêt personnelle",
  description:"Située dans les Landes, à Soustons, grande caravane avec auvent, petite piscine etc",category:"caravane",
  price_per_night:"4",
  street:"17 route de Tosse",
  city:"Soustons",
  country:"France",
  zip_code:"40140",
  user_id: 5,
  image_data: "chjtpyjpmsjxwcehpzs1.jpg, fyf5b8zmlt3nxdyuugng.jpg, toe.jpg, salon2.jpg"
  },
  {title:"Chambre dans ma maison à proximité de Toulouse",
  description:"Grande Chambre dans ma maison personnelle à Colomiers, proche de Toulouse. Maison avec piscine, salle  de bains privative, wifi etc. Je peux vous servir un bon ptit dej!",
  category:"maison",
  price_per_night:"3",
  street:"40 allée du Somport",
  city:"Colomiers",
  country:"France",
  zip_code:"31770",
  user_id: 6,
  image_data: "montagne.jpg, kitchen2.jpg, londres.jpg, matograine.jpg, chlqtvgopj4lgxq7q9e4.jpg, terrasse.jpg"
  },
]

flats.each do |flat|
  puts "----"
  puts "creating a new logement"
  Flat.create!(flat)
  sleep 2
end
