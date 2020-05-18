require 'recipe'

describe Recipe do

  describe ".all" do
    it "returns a list of all recipes" do
      recipes = Recipe.all

      expect(recipes).to include("Recipe One")
      expect(recipes).to include("Recipe Two")
      expect(recipes).to include("Recipe Three")
      
    end
  end
  
end