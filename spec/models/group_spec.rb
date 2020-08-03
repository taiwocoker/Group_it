require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:expense_groups) }
    it { should have_many(:expenses).through(:expense_groups) }
  end
end
