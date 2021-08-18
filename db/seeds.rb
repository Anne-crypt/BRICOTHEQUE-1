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
raph = User.create({email: "raphael@lewagon.org", first_name: "Edouard", last_name: "Kalino", admin: true, password: "test-test"})
puts "Amdin user created"

CATEGORIES = ["garden", "machinery", "home", "mechanic"]
puts "Creating Tools..."
hammer = Tool.create({name: "Beautiful hammer", category: CATEGORIES[0], price_day: 14, price_deposit: 145, description: "this is a description test for the hammer", user_id: raph.id})
screwer = Tool.create({name: "Clean screwer", category: CATEGORIES[1], price_day: 25, price_deposit: 335, description: "this is a description test for the screwer", user_id: raph.id})
screwdriver = Tool.create({name: "Smooth screwdriver", category: CATEGORIES[2], price_day: 43, price_deposit: 255, description: "this is a description test for the screwdriver", user_id: raph.id})
broom = Tool.create({name: "Efficient broom", category: CATEGORIES[3], price_day: 32, price_deposit: 98, description: "this is a description test for the broom", user_id: raph.id})
puts "You are good to go!"

dorien = User.create({email: "test@lewagon.org", first_name: "Dorien", last_name: "RE", admin: false, password: "test-test"})
rahim = User.create({email: "pauillacrahimdev@gmail.com", first_name: "rahim", last_name: "pauillac", admin: false, password: "password973"})

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
booking2.user = dorien
booking2.start_date = Date.today
booking2.end_date = Date.today
booking2.save

puts "now you're good to go! "
