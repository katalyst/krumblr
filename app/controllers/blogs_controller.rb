class BlogsController < ApplicationController
    def show
        @blog = Blog.find(params[:id])
        @posts = @blog.posts
    end
    
    def create
        @blog = Blog.new(blog_params)
        # @blog.user_id = $user_id
        # abort @blog.inspect
        if @blog.save! 
            flash[:success] = "New blog created!"
            redirect_back(fallback_location: root_path) 
        else
            flash[:error] = "Failed to create a new blog."
            redirect_back(fallback_location: root_path)
        end
    end

    private
    def blog_params
        params.require(:blog).permit(:blogname, :user_id)
    end
end
