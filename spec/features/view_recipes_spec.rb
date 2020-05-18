feature 'Viewing recipes' do
  scenario 'visiting inde page' do
    visit('/')
    expect(page).to have_content 'Recipes'
  end

  scenario 'A user can see recipes' do
    visit('/recipes')
    expect(page).to have_content('http://www.mobkitchen.co.uk/recipes/popcorn-cauliflower')
    expect(page).to have_content('https://www.mobkitchen.co.uk/recipes/pesto-veggie-traybake')
    expect(page).to have_content('http://www.mobkitchen.co.uk/recipes/halloumi-crouton-super-salad')
  end
end