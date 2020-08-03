require 'rails_helper'

RSpec.feature 'expense', type: :feature do
  before :each do
    @user = User.create(username: 'user')
    visit login_path
    fill_in 'username', with: 'user'
    click_button 'Log in'
  end

  it 'Should add a new expense' do
    # visit new_group_path
    # fill_in 'group[name]', with: 'Feeding'
    # click_button 'commit'

    visit new_expense_path
    fill_in "name", with: "Shoes"
    fill_in 'expense[amount]', with: 1

    click_button 'commit'
    expect(page).to have_content('My Expenses')
    expect(page).to have_content('Shoes')
    expect(page).to have_content('Expense created successfully.')
  end
end