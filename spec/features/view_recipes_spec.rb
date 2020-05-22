# frozen_string_literal: true
require 'web_helper'

feature 'Viewing recipes' do
  scenario 'visiting inde page' do
    visit('/')
    expect(page).to have_content 'Recipe Manager'
  end

  scenario 'A user can see recipes' do
    create_recipes
    add_recipe

    expect(page).to have_link('Popcorn Cauliflower', href: 'http://www.mobkitchen.co.uk/recipes/popcorn-cauliflower')
    expect(page).to have_link('Pesto Veggie Traybake', href: 'https://www.mobkitchen.co.uk/recipes/pesto-veggie-traybake')
    expect(page).to have_link('Haloumi Salad', href: 'http://www.mobkitchen.co.uk/recipes/halloumi-crouton-super-salad')
  end
end
