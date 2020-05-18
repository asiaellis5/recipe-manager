require 'recipe'
require 'pg'

describe Recipe do

  describe ".all" do
    it "returns a list of all recipes" do

      connection = PG.connect(dbname: 'recipe_manager_test')

      connection.exec("INSERT INTO recipes (url) VALUES('http://www.mobkitchen.co.uk/recipes/popcorn-cauliflower');")
      connection.exec("INSERT INTO recipes (url) VALUES('https://www.mobkitchen.co.uk/recipes/pesto-veggie-traybake');")
      connection.exec("INSERT INTO recipes (url) VALUES('http://www.mobkitchen.co.uk/recipes/halloumi-crouton-super-salad');")
      
      recipes = Recipe.all

      expect(recipes).to include("http://www.mobkitchen.co.uk/recipes/popcorn-cauliflower")
      expect(recipes).to include("https://www.mobkitchen.co.uk/recipes/pesto-veggie-traybake")
      expect(recipes).to include("http://www.mobkitchen.co.uk/recipes/halloumi-crouton-super-salad")
      
    end
  end

  describe ".create" do
    it "adds a new recipe to the database" do
      Recipe.create("https://www.mobkitchen.co.uk/recipes/halloumi-wrap")
      recipes = Recipe.all
      expect(recipes).to include("https://www.mobkitchen.co.uk/recipes/halloumi-wrap")
    end
  end
  
end