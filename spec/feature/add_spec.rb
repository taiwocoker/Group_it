require 'rails_helper'

RSpec.feature 'add', type: :feature do
  before :each do
    @user = User.create(username: 'User')
    visit login_path
    fill_in 'username', with: 'User'
    click_button 'commit'
  end

  it 'Should create a new group' do
    visit new_group_path
    page.has_field? 'name', type: :hidden, with: 'Feeding'
    click_button 'commit'
    expect(page).to have_content('New Group')

  end

  
end
