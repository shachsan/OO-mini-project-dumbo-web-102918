require_relative '../config/environment.rb'
require_relative '../app/models/User.rb'
require 'pry'

manny = User.new("Manny")
sanjay = User.new("Sanjay")
eric = User.new("Eric")
tony = User.new("Tony")

chicken_salad = Recipe.new("Chicke Salad")
cheese_burger = Recipe.new("Cheese Burger")
dumpling = Recipe.new("Dumpling")
salad = Recipe.new("Salad")
chicken_fry = Recipe.new("Chicken Fry")

flour=Ingredient.new("Flour")
peanut=Ingredient.new("Peanut")
vegetable_oil=Ingredient.new("Vegetable Oil")
sugar=Ingredient.new("Sugar")
almond=Ingredient.new("Almond")
salt=Ingredient.new("Salt")
pepper=Ingredient.new("Pepper")
lemon=Ingredient.new("Lemon")
pecan=Ingredient.new("Pecan")


Allergen.new(peanut,eric)
Allergen.new(peanut,sanjay)
Allergen.new(almond,eric)
Allergen.new(salt,eric)
Allergen.new(peanut,tony)
Allergen.new(peanut,manny)
Allergen.new(almond,sanjay)
Allergen.new(flour,eric)

ri_chickenfry = RecipeIngredient.new(chicken_fry, sugar)
ri_salad = RecipeIngredient.new(salad, almond)
ri_salad1 = RecipeIngredient.new(salad, salt)
ri_dumpling = RecipeIngredient.new(dumpling, flour)
ri_cheeseburger = RecipeIngredient.new(cheese_burger, lemon)
ri_chickensalad = RecipeIngredient.new(chicken_salad, pecan)



sanjay.add_recipe_card(dumpling, "09/30/18", 4)
sanjay.add_recipe_card(salad, "10/16/18", 5)
sanjay.add_recipe_card(chicken_salad, "10/30/18", 3)
manny.add_recipe_card(chicken_fry, "09/30/18", 4)
manny.add_recipe_card(cheese_burger, "10/15/18", 5)
manny.add_recipe_card(salad, "08/18/18", 4)
sanjay.add_recipe_card(chicken_fry, "09/30/18", 4)
eric.add_recipe_card(dumpling, "08/12/18", 5)
tony.add_recipe_card(dumpling, "10/28/18", 4)


binding.pry
