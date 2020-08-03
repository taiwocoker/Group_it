require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  before :each do
    @user = User.create(username: 'user')
  end
  it 'Should Create a new user' do
    visit signup_path
    fill_in 'username', with: 'new_user'

    click_button 'Sign up'
    expect(page).to have_content('LOG IN')
  end

  it 'Should Sign in' do
    visit login_path
    fill_in 'username', with: 'user'
    click_button 'Log in'
    expect(page).to have_css('.container')
    
  end

  
end
