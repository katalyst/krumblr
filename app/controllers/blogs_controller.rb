class BlogsController < ApplicationController
    before_action :require_user, only: [:index, :show]

    def show
        @blog = Blog.friendly.find(params[:id])
        @posts = @blog.posts
    end

    def index
        @blogs = Blog.all
    end
    
    def create
        @blog = Blog.new(blog_params)
        if @blog.save! 
            flash[:success] = "New blog created!"
            redirect_back(fallback_location: root_path) 
        else
            flash[:error] = "Failed to create a new blog."
            redirect_back(fallback_location: root_path)
        end
    end

    def update
        
    end    

    def destroy
        Blog.friendly.destroy(params[:id])
        flash[:success] = "Blog deleted"
        redirect_back(fallback_location: root_path)
    end

    private
    def blog_params
        params.require(:blog).permit(:blogname, :user_id)
    end
end
