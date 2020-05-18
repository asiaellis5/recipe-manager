feature 'Viewing recipes' do
  scenario 'visiting inde page' do
    visit('/')
    expect(page).to have_content 'Recipes'
  end

  scenario 'A user can see recipes' do
    visit('/recipes')
    expect(page).to have_content('Recipe One')
    expect(page).to have_content('Recipe Two')
    expect(page).to have_content('Recipe Three')
  end
end