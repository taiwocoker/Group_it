# rubocop:disable Lint/UselessAssignment
require 'rails_helper'

RSpec.describe Expense, type: :model do
  it 'is not valid without a name' do
    expense = Expense.new(name: nil)
    expect(expense).to_not be_valid
  end
  it 'is not valid without a name of minimum length 2 characters' do
    expense = Expense.new(name: 'A')
    expect(expense).to_not be_valid
  end
  it 'is not valid to create another user with the same name' do
    expense = Expense.create(name: 'User')
    expense_new = Expense.new(name: 'User')
    expect(expense_new).to_not be_valid
  end
  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:expense_groups) }
    it { should have_many(:groups).through(:expense_groups) }
  end
end
# rubocop:enable Lint/UselessAssignment
