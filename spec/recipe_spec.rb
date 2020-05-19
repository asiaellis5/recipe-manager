# frozen_string_literal: true

require 'recipe'
require 'pg'
require 'web_helper'

describe Recipe do

  before(:each) do
   create_recipes
  end

  
  describe '.all' do
    it 'returns a list of all recipes' do
      connection = PG.connect(dbname: 'recipe_manager_test')

      recipes = Recipe.all

      expect(recipes[0].title).to eq('Popcorn Cauliflower')
      expect(recipes[0].url).to eq('http://www.mobkitchen.co.uk/recipes/popcorn-cauliflower')
    end
  end

  describe '.create' do
    it 'adds a new recipe to the database' do
      Recipe.create('https://www.mobkitchen.co.uk/recipes/halloumi-wrap', 'Haloumi Wrap')
      recipes = Recipe.all
      expect(recipes[-1].url).to eq('https://www.mobkitchen.co.uk/recipes/halloumi-wrap')
    end
  end

  describe ".update" do
    it "updates a recipe in the database" do
      recipes = Recipe.all
      Recipe.update(recipes[0].id, "https://www.mobkitchen.co.uk/recipes/creamy-vegan-risotto", "Vegan Risotto")
      new_recipes = Recipe.all
      expect(new_recipes[-1].url).to eq "https://www.mobkitchen.co.uk/recipes/creamy-vegan-risotto"
      expect(new_recipes[-1].title).to eq "Vegan Risotto"
    end
  end
end
