require 'rails_helper'

RSpec.describe ExpenseGroup, type: :model do
  describe 'associations' do
    it { should belong_to(:expense) }
    it { should belong_to(:group) }
  end
end