class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @blogs = current_user.blogs
  end

  def show
    unless current_user.blogs.include? @blog
      flash[:notice] = 'Sorry you are not authorised to access this resource'
      redirect_to blogs_path
    end
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
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:name)
    end
end
