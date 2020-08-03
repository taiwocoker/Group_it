require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without a username' do
    user = User.new(username: nil)
    expect(user).to_not be_valid
  end
  it 'is not valid without a username of minimum length of 3 characters' do
    user = User.new(username: 'A')
    expect(user).to_not be_valid
  end
  it 'is not valid to create another user with the same username' do
    user = User.create(username: 'User')
    user_new = User.new(username: 'User')
    expect(user_new).to_not be_valid
  end

  describe 'associations' do
    it { should have_many(:groups).with_foreign_key(:author_id) }
    it { should have_many(:expenses).with_foreign_key(:author_id) }
  end
end
