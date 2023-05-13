require 'rails_helper'

RSpec.describe Like, type: :model do
  user1 = User.new(name: 'Divine', photo: 'https://picsum.photos/200/300', bio: 'I am Divine', postscounter: 4)
  post1 = Post.new(author: user1, title: 'Title', text: ' Post 1', CommentsCounter: 6,
                   LikesCounter: 5)

  like1 = Like.new(author: user1, post: post1)

  it 'check like1s user name is Divine' do
    expect(like1.author.name).to eq('Divine')
  end

  it 'check like1s posts title is Title' do
    expect(like1.post.title).to eq('Title')
  end
end
