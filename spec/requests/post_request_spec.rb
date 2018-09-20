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
          blog = create :blog, user_id: user.id
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

  describe 'POST /blogs/:blog_id/posts' do
    context 'with authenticated user' do
      context 'for existing blog that belongs to current user' do
        before :each do
          blog = create :blog, user_id: user.id
          post("/blogs/#{blog.id}/posts",
               params: { post: attributes_for(:post, tag_list: 'tag1, tag2') })
        end

        it 'creates a new post in the database' do
          expect(Post.count).to eq 1
        end

        it 'creates tags associated with the current post in the database' do
          expect(Post.first.tags).not_to be_empty
        end
      end
    end
  end

  describe 'GET /posts/:id' do
    context 'with authenticated user' do
      it 'responds with success' do
        blog = create :blog
        blog_post = create :post, blog_id: blog.id

        get "/posts/#{blog_post.id}"
        expect(response).to have_http_status :success
      end
    end
  end
end
