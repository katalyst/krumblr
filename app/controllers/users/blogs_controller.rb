class Users::BlogsController < ApplicationController
	before_action :check_user_permission

	def index
		@blogs = current_user.blogs.order("title ASC").page(params[:page]).per(5)
	end

	def new
		@blog = Blog.new
	end

	def show
		@blog = current_user.blogs.find_by(id: params[:id])
	end

	def create
		@blog = Blog.new(blog_params.merge(user_id: current_user.id))

		if @blog.save
			flash[:success] = "Blog has been created successfully"
			redirect_to users_blog_path(@blog)
		else
			render :new
		end
	end

	def edit
		@blog = current_user.blogs.find_by(id: params[:id])

		unless @blog.present?
			flash[:error] = "Blog does not exist"
			redirect_to users_blogs_path
		end
	end

	def update
		@blog = current_user.blogs.find_by(id: params[:id])

		if @blog.present?
			if @blog.update_attributes(blog_params)
				flash[:success] = "Blog has been updated successfully"
				redirect_to users_blog_path(@blog)
			else
				render :edit
			end
		else
			flash[:error] = "Blog does not exist"
			redirect_to users_blogs_path			
		end
	end

	def destroy
		@blog = current_user.blogs.find_by(id: params[:id])

		if @blog.present?
			if @blog.destroy
				flash[:success] = "Blog has been deleted successfully"				
			else
				flash[:error] = "Deleting Blog Failed!"
			end
			redirect_to users_blogs_path
		else
			flash[:error] = "Blog does not exist"
			redirect_to users_blogs_path				
		end
	end

	private
		def blog_params
			params.require(:blog).permit(:title)
		end
end
