require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  before :each do
    @user = User.create(username: 'User')
  end
  it 'Should Register' do
    visit new_user_path
    fill_in 'user[username]', with: 'Username'

    click_button 'commit'
    expect(page).to have_content('LOG IN')
    expect(page).to have_content('Sign up')
  end

  it 'Should Log in' do
    visit login_path
    fill_in 'username', with: 'User'
    click_button 'commit'
    expect(page).to have_content('My Expenses')
    expect(page).to have_content('Log Out')
  end

  
  
end
