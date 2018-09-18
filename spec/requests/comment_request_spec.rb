require 'rails_helper'

describe 'CommentsController', type: :request do
  let(:user) { create(:user, email: 'current_user@example.com') } 
  let(:blog_post) { create(:post) }
  before :each do
    sign_in user
  end

  describe 'GET /blogs/:id/posts/:id/comments/new' do
    context 'with authenticated user' do
      it 'responds with success' do
        get "/posts/#{blog_post.id}/comments/new"
        expect(response).to have_http_status :success
      end
    end
  end

  describe 'POST /posts/:post_id/comments' do
    before :each do
      post("/posts/#{blog_post.id}/comments",
           params: { comment: attributes_for(:comment) })
    end

    context 'with authenticated user' do
      it 'creates a new comment in the database' do
        expect(Comment.count).to eq 1
      end

      it "creates a new comment with commenter's(current user) email" do
        expect(Comment.last.user_email).to eq user.email
      end
    end
  end
end
