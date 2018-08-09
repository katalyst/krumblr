class PostsController < BlogsController
  before_action :require_blog
  before_action :require_user, except: [:index, :show]
  before_action :require_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = @blog.posts.recent_first
  end

  def new
    @post = @blog.posts.new
  end

  def create
    @post = @blog.posts.new(create_post_params)

    if @post.save
      flash[:success] = "Post Saved!"
      render "show" and return
    else
      render "new" and return
    end
  end

  def show
  end

  def edit
  end

  def update
    @post.assign_attributes(update_post_params)

    if @post.save
      flash[:success] = "Post Updated!"
      render "show" and return
    else
      render "edit" and return
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "Post Deleted!"
    else
      flash.now[:error] = "Unable to delete post: #{@post.title}"
    end

    redirect_to blog_posts_path(@blog)
  end

protected
  def create_post_params
    params.require(:post).permit(:title, :content)
  end

  def update_post_params
    params.require(:post).permit(:title, :content)
  end

  def require_post
    @post = @blog.posts.find_by_id(params[:id])

    unless @post
      flash[:error] = "Cannot find post 😅"
      redirect_to blog_posts_path(@blog)
    end
  end
end
