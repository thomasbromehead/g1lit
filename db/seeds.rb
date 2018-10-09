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
#   user = User.create!(first_name:name, email:email, password:password)
# end

  
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
  user_id: 1
  },
  {title: "Appartement de caractère dans monument historique",
  description: "Joli appartement dans un village Mayennais de charme avec canapé-lit et possibilité d'avoir ma chambresi je ne suis pas présente.",
  category:"appartement",
  price_per_night:"7",
  street:"31 rue du Pavé",
  city:"Craon",
  country:"France",
  zip_code:"53400",
  user_id: 2
  }, 
  {title:"Terrain avec étang proche de Saint-Etienne",
  description: "Grand terrain plat chez moi. Etang avec petite barque, possibilité de pécher, possibilité de prendre une douche à la maison",
  category:"terrain",
  price_per_night:"2",
  street:"30 rue Gabriel Péri",
  city:"Le Chambon-Feugerolles",
  country:"France",
  zip_code:"42500",
  user_id: 3
  },
  {title:"Camping-Car sur mon terrain dans le Morbihan",
  description:"Camping-car Peugeot de 2000, m'en sers de temps en temps et est donc en bon état",
  category:"camping-car",
  price_per_night:"3",
  street:"2 Impasse des Chênes",
  city:"Séné",
  country:"France",
  zip_code:"56860",
  user_id: 4
  },
  {title:"Caravane dans ma forêt personnelle",
  description:"Située dans les Landes, à Soustons, grande caravane avec auvent, petite piscine etc",category:"caravane",
  price_per_night:"4",
  street:"17 route de Tosse",
  city:"Soustons",
  country:"France",
  zip_code:"40140",
  user_id: 5
  },
  {title:"Chambre dans ma maison à proximité de Toulouse",
  description:"Grande Chambre dans ma maison personnelle à Colomiers, proche de Toulouse. Maison avec piscine, salle  de bains privative, wifi etc. Je peux vous servir un bon ptit dej!",
  category:"maison",
  price_per_night:"3",
  street:"40 allée du Somport",
  city:"Colomiers",
  country:"France",
  zip_code:"31770",
  user_id: 6
  },
]

flats.each do |flat|
  puts "----"
  puts "creating a new logement"
  Flat.create!(flat)
  sleep 2
end
