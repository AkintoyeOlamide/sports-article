require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
  context 'associations' do
    it { should have_many(:votes) }
    it { should have_many(:articles) }
    it { should have_many(:comments) }
  end

  it 'User is not valid without name attribute' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'User has many articles' do
    expect(User.reflect_on_association(:articles).macro).to eq(:has_many)
  end

  it 'User has many votes' do
    expect(User.reflect_on_association(:articles).macro).to eq(:has_many)
  end
end
