require 'rails_helper'

RSpec.describe 'Renders the post show page', type: :feature do
  before :each do
    @user = User.create(name: 'Enrique', photo: 'https://unsplash.com/photos/ILip77SbmOE',
                        bio: 'Teacher from barbados', postscounter: 5)
    @first_post = Post.create(title: 'Hello there', text: 'This is my first post',
                              CommentsCounter: 0, LikesCounter: 0, author_id: @user.id)
    Comment.create(text: 'Hi Rita!', author_id: @user.id, post_id: @first_post.id)
    Comment.create(text: 'How are you?', author_id: @user.id, post_id: @first_post.id)
    Comment.create(text: 'Howdie!', author_id: @user.id, post_id: @first_post.id)
    @first_post.update(CommentsCounter: @first_post.comments.count)
    visit user_posts_path(@first_post.author, @first_post)
  end
  scenario 'displays the post title' do
    expect(page).to have_content(@first_post.title)
  end
  scenario 'displays number of comments' do
    expect(page).to have_content(/comments: 3/i)
  end
  scenario 'displays number of likes' do
    expect(page).to have_content("Likes: #{@first_post.LikesCounter}")
  end
  scenario 'displays number of comments' do
    expect(page).to have_content(/comments: 3/i)
  end
  scenario 'displays the content of the post' do
    expect(page).to have_content(@first_post.text)
  end
  scenario 'displays comments' do
    expect(page).to have_content('Hi Rita!')
  end
  scenario 'displays the username of each commentor' do
    expect(page).to have_content(@user.name)
    @first_post.comments.each do |comment|
      expect(page).to have_content(comment.author.name)
    end
  end
  scenario 'displays the comments left by each commentor' do
    @first_post.comments.each do |comment|
      expect(page).to have_content(/Comment:.*#{Regexp.escape(comment.text)}/)
    end
  end
end
