
# require 'open-uri'  -> Usa apenas quando pega informações da web.
# require 'json'      -> Usa apenas quando pega informações da web.
# Provavelmente serão necessários após o uso do Cloudinary...

puts "Cleaning up database..."
User.destroy_all
puts "Database cleaned"

user01 = User.create(full_name: 'Han Solo', address: 'Corellia', email: 'solo_han@wookiemail.com', password: 'leachewie')
vehicle01 = Vehicle.create(name: 'Millenium Falcon', category: 'Spaceship', price: 8000000, description: 'Fastest ship in the galaxy.', kilometer: 5000, year: 1977, user: user01)

user02 = User.create(full_name: 'Marty McFly', address: 'HillValley', email: 'outtatime@gmail.com', password: 'timemachine')
vehicle02 = Vehicle.create(name: 'DeLorean', category: 'Time Machine', price: 1500000, description: 'Travel through time in style! Flying car, that uses trash as fuel (Mr. Fusion adapted). Be anywhere, possibilities are endless!', kilometer: 3400, year: 1985, user: user02)

user03 = User.create(full_name: 'Fred Jones', address: 'California', email: 'fred@misterysa.com', password: 'jones00')
vehicle03 = Vehicle.create(name: 'Mistery Machine', category: 'Custom Van', price: 8000, description: 'Planning a road-trip? Awesome! Chasing bad guys and solving misteries? Even better!!', kilometer: 56000, year: 1969, user: user03)
