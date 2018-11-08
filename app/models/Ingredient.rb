
class Ingredient
  attr_accessor :ingredient_name
  @@all = []

  def initialize(ingredient_name)
    @ingredient_name = ingredient_name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
      common_allergen = Hash.new(0)
      Allergen.all.each do |allergen|
        common_allergen[allergen.ingredient]+=1
      end
      common_allergen.max_by{|k,v|v}

  end
end
