# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Offer.destroy_all
User.destroy_all
clement = User.create!(username: "Clément", password: "azerty", email: "clement@wesh.com")
dorian = User.create!(username: "Dorian", password: "azerty", email: "dorian@wesh.com")
manon = User.create!(username: "Manon", password: "azerty", email: "manon@wesh.com")
agathe = User.create!(username: "Agathe", password: "azerty", email: "agathe@wesh.com")
Offer.create!(title: "PS4 à louer", item: "PS4", description: "Ps4 avec des rayures", price_per_day: 15, user_id: manon.id, location: "Clichy", start_date: Date.new(2021,5,18), end_date: Date.new(2022,2,28))
Offer.create!(title: "PS5 bon etat", item: "PS5", description: "dispo à paris du 5 mars jusqu'au 51 avril", price_per_day: 18, user_id: manon.id, location: "Clichy", start_date: Date.new(2021,5,19), end_date: Date.new(2021,6,29))
Offer.create!(title: "Switch + 40 jeux", item: "Switch", description: "Switch avec plein de jeux", price_per_day: 40, user_id: manon.id, location: "Clichy", start_date: Date.new(2021,5,19), end_date: Date.new(2021,12,29))
Offer.create!(title: "Super NES + 2 manettes", item: "SNES", description: "Meilleure console avec les meilleurs jeux", price_per_day: 25, user_id: manon.id, location: "Clichy", start_date: Date.new(2021,5,19), end_date: Date.new(2021,8,29))
Offer.create!(title: "Gameboy advanced", item: "Gameboy", description: "Pas de couleurs", price_per_day: 2, user_id: dorian.id, location: "Paris", start_date: Date.new(2021,5,19), end_date: Date.new(2021,9,29))
Offer.create!(title: "DS + Animal crossing", item: "Nintendo DS", description: "L'écran tactile marche pas", price_per_day: 4, user_id: dorian.id, location: "Paris", start_date: Date.new(2021,5,19), end_date: Date.new(2021,11,29))
Offer.create!(title: "PS3 + call of duty", item: "PS3", description: "Y'a black ops chui prestige 3", price_per_day: 68, user_id: dorian.id, location: "Paris", start_date: Date.new(2021,5,19), end_date: Date.new(2021,10,29))
Offer.create!(title: "Wii U (jamais servi)", item: "WiiU", description: "Prenez la svp", price_per_day: 44, user_id: agathe.id, location: "Orsay", start_date: Date.new(2021,5,19), end_date: Date.new(2021,6,29))
Offer.create!(title: "Switch sans mario kart", item: "Switch", description: "Y'a pas mario kart mais c'est bien quand même", price_per_day: 5, user_id: agathe.id, location: "Orsay", start_date: Date.new(2021,5,19), end_date: Date.new(2021,12,29))
Offer.create!(title: "GameCube + Zelda Ocarina of Time et Soul Calibur", item: "Gamecube", description: "J'ai plus mes sauvegardes par contre", price_per_day: 10, user_id: agathe.id, location: "Orsay", start_date: Date.new(2021,5,19), end_date: Date.new(2021,12,29))
Offer.create!(title: "Playstation 1 + Medievil", item: "PS1", description: "Medievil c'est cool mais ça fait peur", price_per_day: 8, user_id: agathe.id, location: "Orsay", start_date: Date.new(2021,5,19), end_date: Date.new(2021,12,29))
Offer.create!(title: "PC + compte steam", item: "PC", description: "Compte steam avec 400 jeux dont skyrim", price_per_day: 500, user_id: clement.id, location: "Versailles", start_date: Date.new(2021,5,19), end_date: Date.new(2021,12,29))
Offer.create!(title: "Smartphone avec raid shadow legends", item: "iPhone", description: "Raid Shadow Legends est un jeu qui débute", price_per_day: 3, user_id: clement.id, location: "Versailles", start_date: Date.new(2021,5,19), end_date: Date.new(2021,12,29))