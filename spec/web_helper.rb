# frozen_string_literal: true

def add_recipe
  visit('/')
  click_button('Sign Up')
  sign_up
  
  fill_in :title, with: 'Halloumi'
  fill_in :url, with: 'https://www.mobkitchen.co.uk/recipes/halloumi-wrap'
  click_button('Add Recipe')
end

def create_recipes
  Recipe.create('http://www.mobkitchen.co.uk/recipes/popcorn-cauliflower', 'Popcorn Cauliflower')
  Recipe.create('https://www.mobkitchen.co.uk/recipes/pesto-veggie-traybake', 'Pesto Veggie Traybake')
  Recipe.create('http://www.mobkitchen.co.uk/recipes/halloumi-crouton-super-salad', 'Haloumi Salad')
end

def sign_up
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'password'
  click_button('Sign Up')
end
