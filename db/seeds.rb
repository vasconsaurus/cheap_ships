
# require 'open-uri'  -> Usa apenas quando pega informações da web.
# require 'json'      -> Usa apenas quando pega informações da web.
# Provavelmente serão necessários após o uso do Cloudinary...

puts "Cleaning up database..."
User.destroy_all
puts "Database cleaned"

user01 = User.create(full_name: 'Han Solo', address: 'Corellia', email: 'solo_han@wookiemail.com', password: 'leachewie')
vehicle01 = Vehicle.create(name: 'Millenium Falcon', category: 'Spaceship', price: 8000000, description: 'Fastest ship in the galaxy.', kilometer: 5000, year: 1977, user: user01)
url01 = 'https://res.cloudinary.com/vasconsaurus/image/upload/v1646336973/ships%20seed/millenium_falcon_gqkazw.jpg'
vehicle01.photo.attach(io: URI.open(url01), content_type: 'image/png', filename: vehicle01.name)

user02 = User.create(full_name: 'Marty McFly', address: 'HillValley', email: 'outtatime@gmail.com', password: 'timemachine')
vehicle02 = Vehicle.create(name: 'DeLorean', category: 'Time Machine', price: 1500000, description: 'Travel through time in style! Flying car, that uses trash as fuel (Mr. Fusion adapted). Be anywhere, possibilities are endless!', kilometer: 3400, year: 1985, user: user02)
url02 = 'https://res.cloudinary.com/vasconsaurus/image/upload/v1646336973/ships%20seed/delorean_hh0jo4.jpg'
vehicle02.photo.attach(io: URI.open(url02), content_type: 'image/png', filename: vehicle02.name)

user03 = User.create(full_name: 'Fred Jones', address: 'California', email: 'fred@misterysa.com', password: 'jones00')
vehicle03 = Vehicle.create(name: 'Mistery Machine', category: 'Custom Van', price: 8000, description: 'Planning a road-trip? Awesome! Chasing bad guys and solving misteries? Even better!!', kilometer: 56000, year: 1969, user: user03)
url03 = 'https://res.cloudinary.com/vasconsaurus/image/upload/v1646336972/ships%20seed/mystery-machine_paccjb.webp'
vehicle03.photo.attach(io: URI.open(url03), content_type: 'image/png', filename: vehicle03.name)
