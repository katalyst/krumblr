class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :require_permission, except: :create

  def create
    @blog = Blog.find(params[:blog_id])
    @post = Post.new({
      blog: @blog,
      body: post_params[:body],
      user: current_user
    })
    @post.save
    redirect_to blog_path(@blog)
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:id])
    @post.destroy
    redirect_to blog_path(@blog)
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end

  def require_permission
    if current_user!=Post.find(params[:id]).user &&
      current_user!=Post.find(params[:id]).blog.user
      redirect_to root_path
    end
  end
end
