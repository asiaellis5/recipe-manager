# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/flash'
require './lib/recipe'
require './lib/comment'
require './lib/user'
require './database_connection_setup'
require 'uri'


class RecipeManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(params[:email], params[:password])
    session[:user_id] = user.id
    redirect '/recipes'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/recipes')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  get '/recipes' do
    @user = User.find(session[:user_id])
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
    flash[:notice] = "Recipe Updated"
    redirect '/recipes'
  end

  run! if app_file == $PROGRAM_NAME
end
