class BlogsController < ApplicationController
  before_action :require_blog, except: [:new, :create]


  def new
    @blog = current_user.blogs.new
  end

  def create
    @blog = current_user.blogs.new(create_update_blog_params)

    if @blog.save
      flash[:success] = "Blog Created!"
      redirect_to blog_posts_path(@blog)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @blog.assign_attributes(create_update_blog_params)

    if @blog.save
      flash[:success] = "Blog Updated!"
      redirect_to blog_posts_path(@blog)
    else
      render "edit"
    end
  end

  def destroy
    if @blog.destroy
      flash[:success] = "Blog Deleted!"
    else
      flash.now[:error] = "Unable to delete blog: #{@blog.name}"
    end

    redirect_to root_path
  end

  def select
    select_blog @blog

    redirect_to blog_posts_path(@blog)
  end

protected
  def create_update_blog_params
    params.require(:blog).permit(:name)
  end

  def require_blog
    @blog = Blog.where(id: params[:blog_id] || params[:id]).first

    redirect_to root_path unless @blog
  end
end
