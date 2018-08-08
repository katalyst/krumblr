class BlogsController < ApplicationController
  before_action :require_blog

protected
  def require_blog
    @blog = Blog.where(id: params[:blog_id]).first

    redirect_to root_path unless @blog
  end
end
