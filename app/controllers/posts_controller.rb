class PostsController < BlogsController
  before_action :require_user, except: [:index, :show]
  before_action :require_post, only: [:show, :update, :delete]
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
      render "show"
    else
      render "new"
    end
  end

  def show
  end

protected
  def create_post_params
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
