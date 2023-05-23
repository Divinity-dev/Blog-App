require 'rails_helper'

RSpec.describe 'Users Index Page', type: :feature do
  before :each do
    @user = User.create(name: 'Rita', photo: 'https://unsplash.com/photos/rDEOVtE7vOs',
                        bio: 'teacher', postscounter: 5)
    @user2 = User.create(name: 'Enrique', photo: 'https://unsplash.com/photos/ILip77SbmOE',
                         bio: 'teacher', postscounter: 3)
  end

  scenario 'displays all users username' do
    visit '/'
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
  end

  scenario 'displays all users profile photo' do
    visit '/'
    expect(page).to have_css(
      "img[src='#{@user.photo}']", wait: 30
    )

    visit '/'
    expect(page).to have_css(
      "img[src='#{@user2.photo}']", wait: 30
    )
  end

  scenario 'displays number of posts' do
    visit '/'
    expect(page).to have_content(@user.postscounter)
    expect(page).to have_content(@user2.postscounter)
  end

  scenario 'renders the user show page' do
    visit '/'
    click_link(@user.name, match: :first)
    expect(page).to have_content(@user.name)
  end
end
