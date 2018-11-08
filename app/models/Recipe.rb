class Recipe
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def all_recipecards_for_this_recipe
    RecipeCard.select.each do |recipecard|
      recipecard.recipe == self
    end
  end

  def self.most_popular
    recipe_user = Hash.new(0)
    RecipeCard.all.each do |recipecard|
      recipe_user[recipecard.recipe]+=1
    end
    recipe_user.max_by{|k,v|v}
  end

  def users
    all_recipecards_for_this_recipe.map {|recipecard|recipecard.user}
  end

  def ingredients
    RecipeIngredient.all.select {|ri|ri.recipe == self}.map {|ri|ri.ingredient}
  end


  def allergens
    allergen = []
    allergen_ingred = Allergen.all.map {|allergen|allergen.ingredient}
    ingredients.each do |ingredient|
      allergen << ingredient if allergen_ingred.include?(ingredient)
    end
    allergen
  end


  def add_ingredients(ingredient_arr)
    ingredient_arr.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end
  
end
