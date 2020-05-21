require 'web_helper'
feature 'Validation Error' do
  scenario 'An error message pops up if user enters invalid url' do
    visit('/')
    fill_in :title, with: 'Title'
    fill_in :url, with: 'I am not a url'
    click_button('Add Recipe')
    expect(page).not_to have_link('Title', href: 'I am not a url')
    expect(page).to have_content 'Error invalid url'
  end
end