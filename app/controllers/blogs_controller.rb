class BlogsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :require_permission, except: [:index, :show, :new, :create]

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user

    if @blog.save
      redirect_to @blog
    else
      render 'new'
    end
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update(blog_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:text)
  end

  def require_permission
    if current_user != Blog.find(params[:id]).user
      redirect_to root_path
    end
  end
end
