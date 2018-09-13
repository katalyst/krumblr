require 'rails_helper'

describe 'BlogsController', type: :request do
  let(:user) { create(:user, email: 'test_user@example.com') }

  before :each do 
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wildhorses'
    click_button 'Log in'
  end

  describe 'GET /blogs/new' do
    it 'provides user-interface to create a new blog' do
      get '/blogs/new'
      expect(response).to have_http_status :success
      expect(response.body).to include 'Create new project'
    end
  end
end
