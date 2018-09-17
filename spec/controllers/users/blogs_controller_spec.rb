require 'rails_helper'

RSpec.describe Users::BlogsController, type: :controller do
	render_views
	before do
		@user = create :user
		@blog = create :blog, user_id: @user.id
		sign_in @user
	end

	describe '#index' do
		it "should success" do
      get :index
      expect(response).to have_http_status(200)
      expect(assigns(:blogs)).to eq @user.blogs
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
				post :create, params: {blog: {title: "Blog Title"}}
			}.to change(Blog, :count).by(1)
			blog = Blog.last
			expect(response).to redirect_to users_blog_path(blog)
		end

		it "should fail" do
			expect{
				post :create, params: {blog: {title: ""}}
			}.to change(Blog, :count).by(0)
			expect(response).to render_template (:new)
		end
	end

	describe '#show' do
		it "should success" do
      get :show, params: {id: @blog.id}
      expect(response).to have_http_status(200)
      expect(assigns(:blog)).to eq @blog
		end
	end

	describe '#edit' do
		it "should success" do
     	get :edit, params: {id: @blog.id}
      expect(response).to have_http_status(200)
      expect(assigns(:blog)).to eq @blog
		end

		it "should redirect_to users blogs path if blog does not exist" do
     	get :edit, params: {id: "fake_id"}
      expect(response).to redirect_to users_blogs_path
		end
	end

	describe '#update' do
		it "should update blog" do
			put :update, params: {blog: {title: "Blog Title New"}, id: @blog.id}
			expect(@blog.reload.title).to eq "Blog Title New"
			expect(response).to redirect_to users_blog_path(@blog)
		end

		it "should not update" do
			put :update, params: {blog: {title: ""}, id: @blog.id}
      expect(response).to render_template (:edit)
		end

		it "should redirect_to users blogs path if blog does not exist" do
			put :update, params: {id: "fake_id"}
      expect(response).to redirect_to users_blogs_path
		end
	end

	describe '#destroy' do
		it "should destroy blog" do
			delete :destroy, params: {id: @blog.id}
			expect(response).to redirect_to users_blogs_path
			expect(@user.blogs.count).to eq 0
		end

		it "should redirect_to users blogs path if blog does not exist" do
			delete :destroy, params: {id: "fake_id"}
      expect(response).to redirect_to users_blogs_path
		end
	end
end
