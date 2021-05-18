# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Offer.destroy_all
User.destroy_all
test = User.create!(username: "Test", password: "123456", email: "test@email.com")
clement = User.create!(username: "Clément Le Moigne", password: "weshgros69", email: "clement@weshgros.com")
Offer.create!(title: "PS4 à louer", item: "ps4", description: "dispo à paris du 4 mars au 34 avril", price_per_day: 400, user_id: clement.id)
Offer.create!(title: "PS5 à louer", item: "ps5", description: "dispo à paris du 5 mars au 51 avril", price_per_day: 9900, user_id: clement.id)
