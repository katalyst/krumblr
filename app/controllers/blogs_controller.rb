class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_user_authority, only: [:edit, :update, :destroy]

  def index
    @blogs = current_user.blogs
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = current_user.blogs.build(blog_params)

    if @blog.save
      redirect_to @blog, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'Blog was successfully destroyed.' 
  end

  private 

    def set_blog
      @blog = Blog.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = 'Sorry this resource does not exit'
      redirect_to blogs_path
    end

    def check_user_authority
      unless current_user.has_access_to?(@blog)
        flash[:notice] = 'Sorry you are not authorised to access this resource'
        redirect_to blogs_path
      end
    end

    def blog_params
      params.require(:blog).permit(:name)
    end
end
