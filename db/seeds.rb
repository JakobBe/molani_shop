puts "Seeding starts"

names = ["Krawatte", "Schal", "Hosentraeger", "Einstecktuch", "Socken", "Fliege", "Guertel", "Manschettenknoepfe"]
Item.destroy_all

names.each do |name|
  i = 1
  4.times do
    Item.create(name: "#{name}#{i}", price: rand(20..400))
    i += 1
  end
end

puts "Seeding done"
