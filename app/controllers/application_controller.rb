class ApplicationController < ActionController::Base
  helper_method :my_blogs, :selected_blog

protected
  def require_user
    redirect_to root_path unless current_user
  end

  def require_blog
    @blog = Blog.where(id: params[:blog_id] || params[:id]).first

    redirect_to root_path unless @blog
  end

  def selected_blog
    Blog.find_by_id(session[:selected_blog_id]) || my_blogs.first
  end

  def select_blog(blog)
    session[:selected_blog_id] = blog.id
  end

  def my_blogs
    if current_user
      current_user.blogs
    else
      Blog.unscoped
    end
  end

  def no_search
    @no_search = true
  end
end
