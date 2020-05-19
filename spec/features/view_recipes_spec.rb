# frozen_string_literal: true

feature 'Viewing recipes' do
  scenario 'visiting inde page' do
    visit('/')
    expect(page).to have_content 'Recipes'
  end

  scenario 'A user can see recipes' do
    connection = PG.connect(dbname: 'recipe_manager_test')

    Recipe.create('http://www.mobkitchen.co.uk/recipes/popcorn-cauliflower', 'Popcorn Cauliflower')
    Recipe.create('https://www.mobkitchen.co.uk/recipes/pesto-veggie-traybake', 'Pesto Veggie Traybake')
    Recipe.create('http://www.mobkitchen.co.uk/recipes/halloumi-crouton-super-salad', 'Halloumi Salad')

    visit('/')
    click_button('View Recipes')

    expect(page).to have_link('Popcorn Cauliflower', href: 'http://www.mobkitchen.co.uk/recipes/popcorn-cauliflower')
    expect(page).to have_link('Pesto Veggie Traybake', href: 'https://www.mobkitchen.co.uk/recipes/pesto-veggie-traybake')
    expect(page).to have_link('Halloumi Salad', href: 'http://www.mobkitchen.co.uk/recipes/halloumi-crouton-super-salad')
  end
end
