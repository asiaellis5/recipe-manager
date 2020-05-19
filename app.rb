# frozen_string_literal: true

require 'sinatra/base'
require './lib/recipe'
require './database_connection_setup'

class RecipeManager < Sinatra::Base
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :'recipes/index'
  end

  post '/recipes/add' do
    Recipe.create(params[:url], params[:title])
    redirect '/recipes'
  end

  get '/recipes/:id/update' do
    @recipe = Recipe.find(params[:id])
    erb :'recipes/update'
  end

  patch '/recipes/:id' do
    Recipe.update(params[:id], params[:url], params[:title])
    redirect '/recipes'
  end

  delete '/recipe/:id' do
    Recipe.delete(params[:id])
    redirect '/recipes'
  end



  run! if app_file == $PROGRAM_NAME
end
