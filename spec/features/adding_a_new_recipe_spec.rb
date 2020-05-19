# frozen_string_literal: true

require 'web_helper'

feature 'Adding Recipes' do
  scenario 'it allows the user to add a new recipe' do
    add_recipe
    expect(page).to have_content 'Halloumi'
    expect(page).to have_link('Halloumi', href: 'https://www.mobkitchen.co.uk/recipes/halloumi-wrap')
  end
end
