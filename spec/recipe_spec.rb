require 'recipe'

describe Recipe do

  describe ".all" do
    it "returns a list of all recipes" do
      recipes = Recipe.all

      expect(recipes).to include("http://www.mobkitchen.co.uk/recipes/popcorn-cauliflowers")
      expect(recipes).to include("https://www.mobkitchen.co.uk/recipes/pesto-veggie-traybake")
      expect(recipes).to include("http://www.mobkitchen.co.uk/recipes/halloumi-crouton-super-salad")
      
    end
  end
  
end