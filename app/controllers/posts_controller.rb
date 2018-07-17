class PostsController < ApplicationController
    before_action :require_user, only: [:index, :show]

    def show
        @post = Post.friendly.find(params[:id])
        @comments = @post.comments   
        @parent_blog = Blog.friendly.find(@post.blog_id)
        @parent_user = User.friendly.find(@parent_blog.user_id)
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

    def destroy
        Post.friendly.destroy(params[:id])
        flash[:success] = "Post deleted"
        redirect_back(fallback_location: root_path)
    end

    private
    def post_params
        params.require(:post).permit(:title, :text, :blog_id)
    end
end
