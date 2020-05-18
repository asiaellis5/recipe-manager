require 'sinatra/base'

class RecipeManager < Sinatra::Base
  get '/' do
    'Recipes'
  end

  get '/recipes' do
    recipes = ["Recipe One", "Recipe Two", "Recipe Three"]
    recipes.join(",")
  end

  run! if app_file == $0
end