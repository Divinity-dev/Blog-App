require 'rails_helper'

RSpec.describe User, type: :model do
  user1 = User.new(name: 'Divine', photo: 'https://picsum.photos/200/300', bio: 'I am Divine', postscounter: 4)
  user2 = User.new(name: 'Jonas', photo: 'https://picsum.photos/200/300', bio: 'I am Jonas', postscounter: -2)
  user3 = User.new(name: '', photo: 'https://picsum.photos/200/300', bio: 'I am David', postscounter: 3)

  it 'check user1s name not be blank' do
    expect(user1.name).to_not eq('')
  end

  it 'check user1s photo is a string' do
    expect(user1.photo).to eq('https://picsum.photos/200/300')
  end

  it 'check user1s name shorter than 250 characters' do
    expect(user1.name.length < 250).to eq(true)
  end

  it 'check user1s posts_counter be integer' do
    expect(user1.postscounter >= 0).to eq(true)
  end

  it 'check user2s posts_counter lower than 0' do
    expect(user2).to_not be_valid
  end

  it 'check user3s name not be blank' do
    expect(user3).to_not be_valid
  end
end
