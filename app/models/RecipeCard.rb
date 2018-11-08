class RecipeCard
  attr_accessor :recipe, :user, :date, :rating
  @@all = []

  def initialize(user, recipe, date, rating=0)
    @date = date
    @user = user
    @recipe = recipe
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

end
