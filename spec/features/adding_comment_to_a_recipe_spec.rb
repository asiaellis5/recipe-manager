require 'web_helper'

feature 'Adding a comment to a recipe' do
  scenario 'it allows a user to add a comment' do
    add_recipe
    find('#AddCommentHalloumi').click
    fill_in :comment, with: 'I am a comment'
    click_button('Add')
    expect(page).to have_content 'I am a comment'
  end
end