class PostsController < ApplicationController
    def show
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.new(post_params)
        # @blog.user_id = $user_id
        # abort @blog.inspect
        if @post.save! 
            flash[:success] = "New post created!"
            redirect_back(fallback_location: root_path) 
        else
            flash[:error] = "Failed to create a new post."
            redirect_back(fallback_location: root_path)
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :text, :blog_id)
    end
end
