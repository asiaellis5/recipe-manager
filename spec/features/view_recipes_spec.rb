feature 'Viewing recipes' do
  scenario 'visiting inde page' do
    visit('/')
    expect(page).to have_content 'Recipes'
  end
end