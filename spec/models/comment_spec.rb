require 'rails_helper'

RSpec.describe Comment, type: :model do
  user1 = User.new(name: 'Divine', photo: 'https://picsum.photos/200/300', bio: 'I am Divine', postscounter: 4)
  post1 = Post.new(author: user1, title: 'Title', text: ' Post1', CommentsCounter: 6,
                   LikesCounter: 5)

  comment1 = Comment.new(author: user1, post: post1, text: 'texting')
  it 'check comment1s text is equal "texting"' do
    expect(comment1.text).to eq('texting')
  end

  it ' check comment1s author name is Divine' do
    expect(comment1.author.name).to eq('Divine')
  end

  it 'check comment1s post title "Title" is true' do
    expect(comment1.post.title == 'Title').to eq(true)
  end
end
