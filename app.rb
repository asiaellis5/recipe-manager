require 'sinatra/base'
require './lib/recipe'

class RecipeManager < Sinatra::Base
  get '/' do
    'Recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :'recipes/index'
  end

  run! if app_file == $0
end