# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

require 'open-uri'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# TIngredient.create(name: "lemon")
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

puts 'Create ingredients'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingredients = JSON.parse(open(url).read)

ingredients['drinks'].each do |ingredient|
  i = Ingredient.create(name: ingredient['strIngredient1'])
  puts "create #{i.name}"
end

puts 'drinks'

Cocktail.create(name: 'Mojito')
Cocktail.create(name: 'Long Island Iced Tea')
Cocktail.create(name: 'Caipirinha')
Cocktail.create(name: 'Moscow Mule')
Cocktail.create(name: 'Daiquiri')
Cocktail.create(name: 'Old Fashioned')

descriptions = ["2 spoon of", "4 splash of", "3 pieces of", "2l of"]

20.times do
  Dose.create(
    description: descriptions.sample,
    ingredient: Ingredient.all.sample,
    cocktail: Cocktail.all.sample
  )
end
