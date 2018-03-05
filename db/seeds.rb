# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#DESTROY BY HAND
Product.destroy_all
User.destroy_all

Brick = User.create!(email: "greg@youguild.com", password: "azertyuiop")
Chris = User.create!(email: "chris.ck@hotmail.com", password: "azertyuiop")
Product.create!(user: Brick, name: "Pantalon bleu", brand: "The Kooples", tagline: "Le plus beau pantalon", size: "XS", sku: "AEAK41AE", category: "Homme")
Product.create!(user: Chris, name: "Jupe rouge", brand: "Sandro", tagline: "Amazing skirt", size: "34", sku: "AakrA551", category: "Femme")
