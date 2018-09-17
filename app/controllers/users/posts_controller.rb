class Users::PostsController < ApplicationController
	before_action :check_user_permission
	before_action :blog_belongs_to_user?, only: [:create, :update]

	def index
		@posts = current_user.posts.order("title ASC").page(params[:page]).per(5)
	end

	def new
		@post = Post.new(blog_id: params[:blog_id])
	end

	def create
		@post = Post.new(post_params.merge(user_id: current_user.id))

		if @post.save
			flash[:success] = "Post has been created successfully"
			redirect_to users_blog_path(@post.blog)
		else
			render :new
		end
	end

	def show
		@post = current_user.posts.find_by(id: params[:id])
	end

	def edit
		@post = current_user.posts.find_by(id: params[:id])

		unless @post.present?
			flash[:error] = "Post does not exist"
			redirect_to users_posts_path
		end
	end

	def update
		@post = current_user.posts.find_by(id: params[:id])

		if @post.present?
			if @post.update_attributes(post_params)
				flash[:success] = "Post has been updated successfully"
				redirect_to users_post_path(@post)
			else
				render :edit
			end
		else
			flash[:error] = "Post does not exist"
			redirect_to users_posts_path			
		end	
	end

	def destroy
		@post = current_user.posts.find_by(id: params[:id])

		if @post.present?
			if @post.destroy
				flash[:success] = "Post has been deleted successfully"				
			else
				flash[:error] = "Deleting post failed!"
			end
			redirect_to users_posts_path
		else
			flash[:error] = "Post does not exist"
			redirect_to users_posts_path				
		end
	end

	private
		def post_params
			params.require(:post).permit(:title, :body, :blog_id, :tag_ids => [])
		end

		def blog_belongs_to_user?
			if post_params[:blog_id].blank? || current_user.blogs.find_by(id: post_params[:blog_id]).blank?
				redirect_to users_blogs_path
			end
		end
end
