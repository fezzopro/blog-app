require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) do
      User.create(name: 'Felix', photo: 'image.png',
                          bio: 'Developer.', post_counter: 0)
    end
    it 'eager loads all files without errors' do
      expect { Rails.application.eager_load! }.not_to raise_error
    end

    it 'should be successfull' do
      get '/users'
      # puts(response)
      assert_response :success
    end

    # it 'should return HTTP 200 status code' do
    #   get '/users'
    #   puts(response)
    #   expect(response.status).to eq(200)
    # end

    # it 'should render users view template' do
    #   get '/users'
    #   expect(response).to render_template('users/index')
    #   expect(response).to render_template(:index)
    # end

    # it 'should return the correct content' do
    #   get '/users'
    #   expect(response.body).to include('All users')
    # end
  end

  let(:user) do
    { id: 1 }
  end

  # describe 'show page' do
  #   it 'renders specific users\'s detail page successfully' do
  #     get "/users/#{user[:id]}"
  #     expect(response).to have_http_status(:success)
  #   end

  #   it 'should render specific user view' do
  #     get "/users/#{user[:id]}"
  #     expect(response).to render_template('users/show')
  #     expect(response).to render_template(:show)
  #   end
  # end
end
