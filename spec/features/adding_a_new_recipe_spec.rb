# frozen_string_literal: true

feature 'Adding Recipes' do
  scenario 'it allows the user to add a new recipe' do
    visit('/')
    fill_in :title, with: 'Halloumi Wrap'
    fill_in :url, with: 'https://www.mobkitchen.co.uk/recipes/halloumi-wrap'
    click_button('Add Recipe')
    expect(page).to have_content 'Halloumi Wrap'
    expect(page).to have_link('Halloumi Wrap', href: 'https://www.mobkitchen.co.uk/recipes/halloumi-wrap')
  end
end
