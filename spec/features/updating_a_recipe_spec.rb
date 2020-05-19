require 'web_helper'

feature "Updating Recipes" do
  scenario "it allows the user to update a recipe" do
    add_recipe
    find("#UpdateHalloumi").click
    fill_in :title, with: 'Vegan Risotto'
    fill_in :url, with: "https://www.mobkitchen.co.uk/recipes/creamy-vegan-risotto"
    click_button("Submit")
    expect(page).to have_content("Vegan Risotto")
    expect(page).to have_link('Vegan Risotto', href: "https://www.mobkitchen.co.uk/recipes/creamy-vegan-risotto")
  end
end