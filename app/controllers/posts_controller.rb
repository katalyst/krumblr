class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_blog, only: [:new, :create]
  before_action :set_post, only: [:show]

  def new
    @post = @blog.posts.build
  end

  def create
    @post = @blog.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  private

  def load_blog
    @blog = current_user.blogs.find(params[:blog_id])
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = 'Sorry this resource does not exit'
    redirect_to blogs_path
  end

  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = 'Sorry this resource does not exit'
    redirect_to blogs_path
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
