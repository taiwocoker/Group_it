require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  before :each do
    @user = User.create(username: 'User')
  end
  it 'Should Create a new user' do
    visit new_user_path
    fill_in 'user[username]', with: 'Username'

    click_button 'Sign up'
    expect(page).to have_content('LOG IN')
  end

  it 'Should Sign in' do
    visit login_path
    fill_in 'session[username]', with: 'User'
    click_button 'Log in'
    # expect(page).to have_css('.user_avatar')
    expect(page).to have_content('My External expenses')
  end

  it 'Should Log out' do
    visit login_path
    fill_in 'username', with: 'User'
    click_button 'commit'
    click_on 'Log Out'
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Successfully logged out.')
  end
end
