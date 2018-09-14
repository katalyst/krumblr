require 'rails_helper'

describe 'PostsController', type: :request do
  let(:user) { create(:user, email: 'test_user@example.com') }

  before :each do
    sign_in user
  end

  describe 'GET /blogs/:id/posts/new' do
    context 'with authenticate user' do
      context 'for existing blog that belongs to current user' do
        it 'responds with success' do
          blog = create :blog
          get "/blogs/#{blog.id}/posts/new"
          
          expect(response).to have_http_status :success
        end
      end

      context 'for non existing blog' do
        it 'responds with a redirect' do
          get "/blogs/1/posts/new"
          expect(response).to have_http_status 302
        end
      end

      context 'for blog that does not belong to current user' do
        it 'responds with a redirect' do
          other_user = create :user
          other_blog = create :blog, user_id: other_user.id
          get "/blogs/#{other_blog.id}/posts/new"

          expect(response).to have_http_status 302
        end
      end
    end
  end
end
