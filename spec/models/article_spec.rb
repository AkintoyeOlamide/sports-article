require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:title) }
  end
  context 'associations' do
    it { should have_many(:votes) }
    it { should belong_to(:category) }
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end

  it 'Article is not valid without title' do
    @article = Article.new(body: 'b', category_id: category.id, user_id: user.id)
    expect(@article).to_not be_valid
  end

  it 'Article is not valid without body' do
    @article = Article.new(title: 'a', category_id: category.id, user_id: user.id)
    expect(@article).to_not be_valid
  end

  it 'Article is not valid without user' do
    @article = Article.new(title: 'a', body: 'b', category_id: category.id)
    expect(@article).to_not be_valid
  end

  it 'Article is not valid without category' do
    @article = Article.new(title: 'a', body: 'b', user_id: user.id)
    expect(@article).to_not be_valid
  end
end
