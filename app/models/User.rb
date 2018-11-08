require 'pry'
class User
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def user_recipescard

    RecipeCard.all.select do |recipecard|
      recipecard.user == self
    end
  end

  def recipes
    user_recipescard.map do |recipecard|
      recipecard.recipe
    end
  end



  def add_recipe_card(recipe, date, rating)

    RecipeCard.new(self, recipe, date, rating)

  end

  def declare_allergen(ingredient)

    Allergen.new(ingredient, self)
  end

  def allerges

    Allergen.all.select {|allergen|allergen.user == self}.map{|allergen|allergen.ingredient}
  end

  def top_three_recipes

    ratings = user_recipescard.sort_by{|recipecard|recipecard.rating}
    top_three = [ratings[-1],ratings[-2],ratings[-3]]
  end

  def most_recent_recipe

    user_recipescard.last
  end

  def safe_recipes
    RecipeIngredient.all.reject do |recipe_ind|
      allerges.include?(recipe_ind.ingredient)
    end.safe.map {|ri| ri.recipe}
  end
end
