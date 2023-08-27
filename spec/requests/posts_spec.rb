require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) do
    { id: 1 }
  end

  let(:post) do
    { id: 1 }
  end

  describe 'main post\'s page' do
    it 'should render the main page successfully' do
      get "/users/#{user[:id]}/posts"
      expect(response).to have_http_status(:success)
    end

    it 'should render index template of post' do
      get "/users/#{user[:id]}/posts"
      expect(response).to render_template(:index)
    end

    it 'should render All posts by single user' do
      get "/users/#{user[:id]}/posts"
      expect(response.body).to render_template(:post)
    end
  end

  describe 'show page of posts' do
    it 'Should render Individual post by single user successfully' do
      get "/users/#{user[:id]}/posts/#{post[:id]}"
      expect(response).to have_http_status(:success)
    end

    it 'render show template of post' do
      get "/users/#{user[:id]}/posts/#{post[:id]}"
      expect(response).to render_template(:show)
    end

    it 'shows the post\'s show page data' do
      get "/users/#{user[:id]}/posts/#{post[:id]}"
      expect(response.body).to include('Individual post by single user')
    end
  end
end
