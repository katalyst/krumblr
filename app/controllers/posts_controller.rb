class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :require_permission, except: [:create, :repost]

  def repost
    Post.create(
      blog: Blog.find(params[:blog_id]),
      body: Post.find(params[:post_id]).body,
      user: current_user
    )
    redirect_to blog_path(params[:blog_id])
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @post = Post.create(
      blog: @blog,
      body: post_params[:body],
      user: current_user
    )
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
    post = Post.find(params[:id])
    if current_user!=post.user &&
      current_user!=post.blog.user
      redirect_to root_path
    end
  end
end
