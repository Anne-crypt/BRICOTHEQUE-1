require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Booking.destroy_all
Tool.destroy_all
User.destroy_all
Review.destroy_all
puts "Database cleaned"

puts "Creating Amdin user..."
raph = User.create({email: "raphael@lewagon.org", first_name: "Edouard", last_name: "Kalino", admin: true, password: "test-test", address: "16 Villa Gaudelet, Paris 11e Arrondissement, Île-de-France, Frankrijk"})
puts "Amdin user created"

CATEGORIES = Tool::CATEGORIES
puts "Creating Tools..."

adjustablewrench = Tool.new({name: "Adjustable Wrench", address: "100 rue Alexandre Dumas, Paris", category: CATEGORIES[3], price_day: 14, price_deposit: 145, description: "So convenient, best wrench ever", user_id: raph.id})
hammer = Tool.new({name: "Beautiful hammer", address: "16 Villa Gaudelet, Paris", category: CATEGORIES[0], price_day: 14, price_deposit: 145, description: "Solid head set crosswise on a handle. I build my whole house with it.", user_id: raph.id})
screwer = Tool.new({name: "Clean screwer", address: "1 avenue Netter, Paris", category: CATEGORIES[1], price_day: 25, price_deposit: 335, description: "Simple tool used to drive bolts and screws with hexagonal heads. The tool is formed of a single piece.", user_id: raph.id})
screwdriver = Tool.new({name: "Smooth screwdriver", address: "12 rue du bac, Paris", category: CATEGORIES[2], price_day: 43, price_deposit: 255, description: "For turning screws. All screws can be deal with with this standard screwdriver.", user_id: raph.id})
broom = Tool.new({name: "Efficient broom", address: "2 rue Ledru-Rollin, Paris", category: CATEGORIES[3], price_day: 32, price_deposit: 98, description: "Awesome broom - so efficient", user_id: raph.id})

urladjustablewrench = URI.open("https://www.stanleytools.com/NA/product/images/3000x3000x96/90-947/90-947_1.jpg")
urlshammer = URI.open("https://www.radtke-messtechnik.com/wp-content/uploads/2017/01/Hammer-gross-2_2048x-1024x686.jpg")
urlscrewer = URI.open("https://media.istockphoto.com/photos/spanner-isolated-on-white-picture-id498761286?k=6&m=498761286&s=612x612&w=0&h=Ng2IAkDjJPcU3UUN4ny7pw6fmdu-K5-k19zgFaFsWRM=")
urlscrewdriver = URI.open("https://shop.harborfreight.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/i/m/image_20989.jpg")
urlbroom = URI.open("https://cdn.shopify.com/s/files/1/1326/7515/products/Barn_Broom_2048x.jpg?v=1533896902")

adjustablewrench.photos.attach(io: urladjustablewrench, filename: "adjustableWrench.jpeg", content_type: 'image/jpg')
hammer.photos.attach(io: urlshammer, filename: "hammer.jpg", content_type: 'image/jpg')
broom.photos.attach(io: urlbroom, filename: "broom.jpg", content_type: 'image/jpg')
screwer.photos.attach(io: urlscrewer, filename: "screwer.jpg", content_type: 'image/jpg')
screwdriver.photos.attach(io: urlscrewdriver, filename: "screwdriver.jpg", content_type: 'image/jpg')

adjustablewrench.save
hammer.save
screwer.save
broom.save
screwdriver.save

puts "5 tools are generated"

dorien = User.create({email: "test@lewagon.org", first_name: "Dorien", last_name: "RE", admin: false, password: "test-test", address: "16 Villa Gaudelet, Paris 11e Arrondissement, Île-de-France, Frankrijk"})
rahim = User.create({email: "pauillacrahimdev@gmail.com", first_name: "rahim", last_name: "pauillac", admin: false, password: "password973" , address: "16 Villa Gaudelet, Paris 11e Arrondissement, Île-de-France, Frankrijk"})


puts "create second user Dorien"
puts 'Dorien books the hammer (and is confirmed by Raph)'
puts 'Dorien books the screwdriver (but isnt confirmed yet)'

booking1 = Booking.new
booking1.tool = hammer
booking1.user = dorien
booking1.start_date = Date.today
booking1.end_date = Date.today
booking1.status = "confirmed"
booking1.save

booking2 = Booking.new
booking2.tool = screwdriver
booking2.user = rahim
booking2.start_date = Date.today
booking2.end_date = Date.today
booking2.save

puts "now you're good to go! "
