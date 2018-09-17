require 'rails_helper'

RSpec.describe Users::CommentsController, type: :controller do
	render_views
	before do
		@user = create :user
		@blog = create :blog, user_id: @user.id
		@post = create :post, user_id: @user.id, blog_id: @blog.id
		sign_in @user
	end

	describe '#new' do
		it "should success" do
      get :new, params: {post_id: @post.id}, xhr: true, format: :js
      expect(response).to have_http_status(200)
		end

		it "should set devise user return to sesson" do
			sign_out @user
			get :new, params: {post_id: @post.id}, xhr: true, format: :js
			expect(session["user_return_to"]).to eq post_path(@post.id)
		end
	end

	describe '#create' do
		it "should success" do
      post :create, params: {comment: {post_id: @post.id, body: "Coment Body"}}, xhr: true, format: :js
      expect(@post.comments.count).to eq 1
      expect(response).to have_http_status(200)
		end
	end
end
