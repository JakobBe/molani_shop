puts "Seeding starts"

names = ["Krawatte", "Schal", "Hosenträger", "Einstecktuch", "Socken", "Fliege", "Gürtel", "Manschettenknöpfe"]
Item.destroy_all

10.times do
  Item.create(name: names.sample, price: rand(20..400))
end

puts "Seeding done"
