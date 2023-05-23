require 'rails_helper'

RSpec.describe 'Render posts index page', type: :feature do
  before :each do
    @user = User.create(name: 'Rita', photo: 'https://unsplash.com/photos/rDEOVtE7vOs',
                        bio: 'Teacher from America.', postscounter: 0)
    @first_post = Post.create(title: 'Hello there', text: 'Beautiful post',
                              CommentsCounter: 0, LikesCounter: 0, author_id: @user.id)
    Comment.create(text: 'Hi Rita!', author_id: @user.id, post_id: @first_post.id)
    Comment.create(text: 'How are you?', author_id: @user.id, post_id: @first_post.id)
    Comment.create(text: 'You know Rails', author_id: @user.id, post_id: @first_post.id)
    visit user_posts_path(@user)
  end

  scenario 'should render user profile photo' do
    expect(page).to have_selector("img[src='#{@user.photo}']")
  end

  scenario 'should display user name' do
    expect(page).to have_content(@user.name)
  end

  scenario 'shows number of user posts' do
    expect(page).to have_content(@user.posts.count)
  end

  scenario 'render button section for Pagination' do
    expect(page).to have_button('Pagination')
  end

  scenario 'redirects to the post show page' do
    click_link('a', match: :first)
    expect(page).to have_content(@first_post.title)
  end

  scenario 'displays post text' do
    expect(page).to have_text('Beautiful post', wait: 10)
  end

  scenario 'display the post title' do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'display the post body' do
    expect(page).to have_content(@first_post.text)
  end

  scenario 'display the first comment on a post' do
    expect(page).to have_content('Hi Rita!')
  end

  scenario 'display the how many comments' do
    expect(page).to have_content(/comments: 3/i)
  end

  scenario 'display the how many Likes' do
    expect(page).to have_content("Likes: #{@first_post.LikesCounter}")
  end
end
