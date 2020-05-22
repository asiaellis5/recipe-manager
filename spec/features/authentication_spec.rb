feature 'authentification' do
  it 'allows a user to sign in' do
    User.create('test@test.com', 'password')
    visit '/sessions/new'
    fill_in(:email, with: 'test@test.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')
    expect(page).to have_content 'Welcome test@test.com'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create('test@test.com', 'password')

    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test@test.com'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create('test@test.com','password')

    visit '/sessions/new'
    fill_in(:email, with: 'test@test.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can sign out' do
    User.create('test@test.com', 'password')

    visit '/sessions/new'
    fill_in(:email, with: 'test@test.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have signed out.'
  end
end