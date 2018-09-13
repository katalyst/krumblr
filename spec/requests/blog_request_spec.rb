require 'rails_helper'

describe 'BlogsController', type: :request do
  let(:user) { create(:user, email: 'test_user@example.com') }

  before :each do 
    sign_in user
  end

  describe 'GET /blogs/new' do
    it 'provides user-interface to create a new blog' do
      get '/blogs/new'
      expect(response).to have_http_status :success
      expect(response.body).to include 'New blog'
    end
  end
end
