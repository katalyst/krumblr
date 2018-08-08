class PostsController < BlogsController
  before_action :require_user, except: [:index, :show]

  def index
    @posts = @blog.posts
  end

  def new
    @post = @blog.posts.new
  end

  def create
    @post = @blog.posts.create(create_post_params)

    render template: :show
  end

protected
  def create_post_params
    params.require(:post).permit(:title, :content)
  end
end
