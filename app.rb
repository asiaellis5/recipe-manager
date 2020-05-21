# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/flash'
require './lib/recipe'
require './lib/comment'
require './database_connection_setup'
require 'uri'


class RecipeManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :'recipes/index'
  end

  post '/recipes/add' do
    flash[:notice] = 'Error invalid url' unless Recipe.create(params[:url], params[:title])
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

  get '/recipes/:id/addcomments' do
    @recipe = Recipe.find(params[:id])
    erb :'recipes/add_comment'
  end

  post '/recipes/:id/comments' do
    Comment.create(params[:comment], params[:id])
    redirect '/recipes'
  end

  run! if app_file == $PROGRAM_NAME
end
