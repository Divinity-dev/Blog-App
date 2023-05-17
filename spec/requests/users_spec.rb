require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) do
    User.create(
      name: 'Rails',
      photo: 'http://rrrr/dee.png',
      bio: 'Winning',
      postscounter: 20
    )
  end

  before do
    get '/users'
  end

  describe 'User GET /index' do
    it 'returns user http success' do
      expect(response).to have_http_status(200)
    end

    it 'renders user template' do
      expect(response).to render_template(:index)
    end

    it 'user response body with correct placeholder' do
      expect(response.body).to include('List Users')
    end
  end

  describe 'User GET /show' do
    before do
      get "/users/#{user.id}"
    end

    it 'returns success for detail user' do
      expect(response).to have_http_status(200)
    end

    it 'renders user detail template' do
      expect(response).to render_template(:show)
    end

    it 'does not render user index template' do
      expect(response).not_to render_template(:index)
    end

    it 'user detail response body with correct placeholder' do
      expect(response.body).to include('User Details')
    end

    it 'user detail response body includes user information' do
      expect(response.body).to include(user.name)
      expect(response.body).to include(user.photo)
      expect(response.body).to include(user.bio)
      expect(response.body).to include(user.postscounter.to_s)
    end
  end
end
