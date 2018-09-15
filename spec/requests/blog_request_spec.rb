require 'rails_helper'

describe 'BlogsController', type: :request do
  let(:user) { create(:user, email: 'test_user@example.com') }

  before :each do 
    sign_in user
  end

  describe 'GET /blogs/new' do
    context 'with authenticated user' do
      it 'provides user-interface to create a new blog' do
        get '/blogs/new'
        expect(response).to have_http_status :success
        expect(response.body).to include 'New blog'
      end
    end

    context 'with unauthenticated user' do
      it 'does not give access' do
        sign_out user

        get '/blogs/new'
        expect(response).to redirect_to new_user_session_url
      end
    end
  end

  describe 'POST /blogs' do
    context 'with authenticated user' do
      before :each do
        post('/blogs',
             params: { blog: attributes_for(:blog) })
      end

      it 'creates a new blog entry associated with the current user' do 
        expect(Blog.count).to eq 1
        expect(user.blogs).to include(Blog.last)
      end
    end
  end

  describe 'GET /blogs/:id' do
    context 'with authenticated user' do
      context 'when requested resource belongs to current user' do
        it 'responds successfully' do
          blog = create(:blog, user: user)
          get "/blogs/#{blog.id}"

          expect(response).to have_http_status :success
        end
      end

      context 'when requested resource does not belong to current user' do
        it 'responds with a redirect' do
          other_blog = create(:blog)
          get "/blogs/#{other_blog.id}"

          expect(response).to have_http_status 302
        end
      end

      context 'when requested resource does not exist' do
        it 'responds with a redirect' do
          get '/blogs/1'
          
          expect(response).to have_http_status 302
        end
      end
    end
  end
end
