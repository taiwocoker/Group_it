require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  before :each do
    @user = User.create(username: 'User')
    visit login_path
    fill_in 'session[username]', with: 'Username'
    click_button 'Log in'
  end

  it 'Should add a new expense' do
    visit new_group_path
    fill_in 'name', with: ''
    click_button 'commit'

    visit new_expense_path
    fill_in 'expense[name]', with: 'Shoes'
    fill_in 'expense[amount]', with: 1

    click_button 'commit'
    expect(page).to have_content('My Expenses')
    expect(page).to have_content('Shoes')
    expect(page).to have_content('Expense created successfully.')
  end
end