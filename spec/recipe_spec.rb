require 'recipe'
require 'pg'

describe Recipe do

  describe ".all" do
    it "returns a list of all recipes" do

      connection = PG.connect(dbname: 'recipe_manager_test')

      Recipe.create('http://www.mobkitchen.co.uk/recipes/popcorn-cauliflower', 'Popcorn Cauliflower')
      Recipe.create('https://www.mobkitchen.co.uk/recipes/pesto-veggie-traybake', 'Pesto Veggie Traybake')
      Recipe.create('http://www.mobkitchen.co.uk/recipes/halloumi-crouton-super-salad', 'Haloumi Salad')
      
      recipes = Recipe.all

      expect(recipes[0].title).to eq("Popcorn Cauliflower")
      # expect(recipes).to include("https://www.mobkitchen.co.uk/recipes/pesto-veggie-traybake")
      # expect(recipes).to include("http://www.mobkitchen.co.uk/recipes/halloumi-crouton-super-salad")
      
    end
  end

  describe ".create" do
    it "adds a new recipe to the database" do
      Recipe.create("https://www.mobkitchen.co.uk/recipes/halloumi-wrap", "Haloumi Wrap")
      recipes = Recipe.all
      expect(recipes[-1].url).to eq("https://www.mobkitchen.co.uk/recipes/halloumi-wrap")
    end
  end
  
end