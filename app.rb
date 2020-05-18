require 'sinatra/base'

class RecipeManager < Sinatra::Base
  get '/' do
    'Recipes'
  end

  run! if app_file == $0
end