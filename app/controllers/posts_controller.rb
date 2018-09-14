class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_blog

  def new
    @post = @blog.posts.build
  end

  private

  def load_blog
    @blog = current_user.blogs.find(params[:blog_id])
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = 'Sorry this resource does not exit'
    redirect_to blogs_path
  end
end
