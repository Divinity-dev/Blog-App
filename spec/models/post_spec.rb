require 'rails_helper'

RSpec.describe Post, type: :model do
  user1 = User.new(name: 'Divine', photo: 'https://picsum.photos/200/300', bio: 'I am Divine', postscounter: 4)
  post1 = Post.new(author: user1, title: 'Title', text: ' Post 1', CommentsCounter: 6, LikesCounter: 5)

  it 'check post1 title presence validation' do
    post1.title = ''
    expect(post1).to_not be_valid
  end

  it 'check post1s title length higher than 250 validation' do
    post1.title = 'two' * 100
    expect(post1).to_not be_valid
  end

  it 'check post1s comments_counter only_integer validation' do
    post1.CommentsCounter = 'two'
    expect(post1).to_not be_valid
  end

  it 'check post1s comments_counter greater_than_or_equal_to: 0 validation' do
    post1.CommentsCounter = -5
    expect(post1).to_not be_valid
  end

  it 'check post1s likes_counter only_integer validation' do
    post1.LikesCounter = 'two'
    expect(post1).to_not be_valid
  end
end
