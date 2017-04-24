# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'
User.destroy_all
Recipe.destroy_all
Rating.destroy_all

category = ["appetizers", "entrees", "salads", "desserts"]


60.times do
  User.create({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::GameOfThrones.character,
    email: Faker::Internet.email,
    password: 'password',
    })
end

40.times do
  user = User.all.sample
  user.recipes.create({
    name: Faker::StarWars.character,
    ingredients: Faker::Food.ingredient,
    difficulty: Faker::Number.between(1, 10),
    prep_time: Faker::Number.between(10, 25),
    category: category.sample,
    instructions: Faker::Lorem.sentences(4),
    votes: Faker::Number.between(1, 5),
    image: Faker::LoremPixel.image("300x300"),
    user_id: user.id
    })
end

60.times do
  user = User.all.sample
  recipe = Recipe.all.sample
  recipe.ratings.create!({
    value: Faker::Number.between(1, 10),
    user_id: user.id,
    recipe_id: recipe.id
    })
end
