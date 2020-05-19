require 'web_helper'

feature 'Deleting Recipes' do
  scenario 'it allows the user to delete a new recipe' do
    add_recipe
    find("#DeleteHalloumi").click
    expect(page).not_to have_content 'Halloumi'
    expect(page).not_to have_link('Halloumi', href: 'https://www.mobkitchen.co.uk/recipes/halloumi-wrap')
  end
end