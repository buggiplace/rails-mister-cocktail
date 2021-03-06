require 'open-uri'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Ingredient.create(name: 'mint leaves')

puts "Starting seed"

puts "Adding the ingredients list"

URL = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_all = open(URL).read
ingredient = JSON.parse(ingredient_all)

ingredient['drinks'].each do |i|
  i.each do |_k, v|
    Ingredient.create(name: v)
  end
end

puts "Seed complete"
