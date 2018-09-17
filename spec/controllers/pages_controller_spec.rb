require 'rails_helper'

RSpec.describe PagesController, type: :controller do
	render_views
	before do
		@user = create :user
		@blog = create :blog, user_id: @user.id, title: "Blog Title Bob"
		@post = create :post, user_id: @user.id, blog_id: @blog.id
	end

	describe '#index' do
		it "should success" do
      get :index
      expect(response).to have_http_status(200)
      expect(assigns(:posts).count).to eq 1
		end
	end

	describe '#post_show' do
		it "should success" do
      get :post_show, params: {id: @post.id}
      expect(response).to have_http_status(200)
      expect(assigns(:post)).to eq @post
		end
	end

	describe '#blog_show' do
		it "should success" do
      get :blog_show, params: {id: @blog.id}
      expect(response).to have_http_status(200)
      expect(assigns(:blog)).to eq @blog
      expect(assigns(:posts).count).to eq @blog.posts.count
		end
	end

	describe '#blog_search' do
		it "should success" do
      post :blog_search, params: {blog_search: {contents: "bob"}}, xhr: true, format: :js
      expect(response).to have_http_status(200)
		end
	end
end
