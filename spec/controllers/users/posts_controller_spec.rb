require 'rails_helper'

RSpec.describe Users::PostsController, type: :controller do
	render_views
	before do
		@user = create :user
		@blog = create :blog, user_id: @user.id
		@post = create :post, user_id: @user.id, blog_id: @blog.id
		sign_in @user
	end

	describe '#index' do
		it "should success" do
      get :index
      expect(response).to have_http_status(200)
      expect(assigns(:posts)).to eq @user.posts
		end
	end

	describe '#new' do
		it "should success" do
      get :new
      expect(response).to have_http_status(200)
		end
	end

	describe '#create' do
		it "should success" do
			expect{
				post :create, params: {post: {title: "Post Title", body: "Post Body", blog_id: @blog.id}}
			}.to change(Post, :count).by(1)
			post = Post.last
			expect(post.title).to eq "Post Title"
			expect(post.body).to eq "Post Body"
			expect(post.blog_id).to eq @blog.id
			expect(response).to redirect_to users_blog_path(@blog)
		end

		it "should fail" do
			expect{
				post :create, params: {post: {title: "", blog_id: @blog.id}, id: @post.id}
			}.to change(Post, :count).by(0)
			expect(response).to render_template (:new)
		end

		it "should redirect_to users blogs path if blog_id blank" do
			expect{
				post :create, params: {post: {title: ""}, id: @post.id}
			}.to change(Post, :count).by(0)
			expect(response).to redirect_to users_blogs_path
		end
	end

	describe '#show' do
		it "should success" do
      get :show, params: {id: @post.id}
      expect(response).to have_http_status(200)
      expect(assigns(:post)).to eq @post
		end
	end

	describe '#edit' do
		it "should success" do
     	get :edit, params: {id: @post.id}
      expect(response).to have_http_status(200)
      expect(assigns(:post)).to eq @post
		end

		it "should redirect_to users posts path if post does not exist" do
     	get :edit, params: {id: "fake_id"}
      expect(response).to redirect_to users_posts_path
		end
	end

	describe '#update' do
		it "should update post" do
			put :update, params: {post: {title: "Post Title New", blog_id: @blog.id}, id: @post.id}
			expect(@post.reload.title).to eq "Post Title New"
			expect(response).to redirect_to users_post_path(@post)
		end

		it "should not update" do
			put :update, params: {post: {title: "", blog_id: @blog.id}, id: @post.id}
      expect(response).to render_template (:edit)
		end

		it "should redirect_to users posts path if post does not exist" do
			put :update, params: {post: {title: "Post Title New", blog_id: @blog.id}, id: "fake_id"}
      expect(response).to redirect_to users_posts_path
		end
	end

	describe '#destroy' do
		it "should destroy post" do
			delete :destroy, params: {id: @post.id}
			expect(response).to redirect_to users_posts_path
			expect(@user.posts.count).to eq 0
		end

		it "should redirect_to posts path if post does not exist" do
			delete :destroy, params: {id: "fake_id"}
      expect(response).to redirect_to users_posts_path
		end
	end
end
