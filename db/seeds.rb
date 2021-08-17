# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Tool.destroy_all
puts "Database cleaned"
CATEGORIES = ["garden", "machinery", "home", "mechanic"]
puts "Creating Tools..."
hammer = {name: "Beautiful hammer", category: CATEGORIES[0], price_day: 14, price_deposit: 145, description: "this is a description test for the hammer", user_id: 1}
screwer = {name: "Clean screwer", category: CATEGORIES[1], price_day: 25, price_deposit: 335, description: "this is a description test for the screwer", user_id: 1}
screwdriver = {name: "Smooth screwdriver", category: CATEGORIES[2], price_day: 43, price_deposit: 255, description: "this is a description test for the screwdriver", user_id: 1}
broom = {name: "Efficient broom", category: CATEGORIES[3], price_day: 32, price_deposit: 98, description: "this is a description test for the broom", user_id: 1}
tools = [hammer, screwer, screwdriver, broom]
tools.each_with_index do |tool, index|
  Tool.create(tool)
  puts "#{index + 1} - #{tool[:name]} has been created"
end
puts "You have created #{tools.length} tools"
puts "Creating Amdin user..."
raph = {email: "raphael@lewagon.org", first_name: "Edouard", last_name: "Kalino", admin: true, password: "test-test"}
User.create(raph)
puts "Amdin user created"
puts "You are good to go!"
