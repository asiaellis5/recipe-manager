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
    it "does not create a recipe if the URL is not valid" do
      Recipe.create('I am not a URL', 'Haloumi Wrap')
      expect(Recipe.all[-1].url).not_to eq 'I am not a URL'
      expect(Recipe.all[-1].title).not_to eq 'Haloumi Wrap'
    end


    it 'adds a new recipe to the database' do
      Recipe.create('https://www.mobkitchen.co.uk/recipes/halloumi-wrap', 'Haloumi Wrap')
      recipes = Recipe.all
      expect(recipes[-1].url).to eq('https://www.mobkitchen.co.uk/recipes/halloumi-wrap')
    end
  end

  describe '.update' do
    it 'updates a recipe in the database' do
      recipes = Recipe.all
      Recipe.update(recipes[0].id, 'https://www.mobkitchen.co.uk/recipes/creamy-vegan-risotto', 'Vegan Risotto')
      new_recipes = Recipe.all
      expect(new_recipes[-1].url).to eq 'https://www.mobkitchen.co.uk/recipes/creamy-vegan-risotto'
      expect(new_recipes[-1].title).to eq 'Vegan Risotto'
    end
  end

  describe '.delete' do
    it 'deletes a recipe from the database' do
      recipes = Recipe.all
      Recipe.delete(recipes[0].id)
      updated_recipes = Recipe.all
      expect(updated_recipes.length).to eq 2
      expect(updated_recipes[0].title).to_not eq "'Popcorn Cauliflower'"
    end
  end

  describe '.find' do
    it 'returns requested recipe' do
      Recipe.create('https://www.mobkitchen.co.uk/recipes/mobs-summer-tomato-pasta', 'Pasta')

      recipes = Recipe.all

      recipe = recipes[-1]

      result = Recipe.find(recipe.id)

      expect(result).to be_a Recipe
      expect(result.id).to eq recipe.id
      expect(result.title).to eq 'Pasta'
      expect(result.url).to eq 'https://www.mobkitchen.co.uk/recipes/mobs-summer-tomato-pasta'
    end
  end
end
