class PostsController < ApplicationController
  before_action :require_blog
  before_action :require_user, except: [:index, :show]
  before_action :require_post, except: [:index, :new, :create]
  before_action :no_search,    except: [:index, :show]

  def index
    @posts = @blog.posts.recent_first.with_reactions.with_tags
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

  def react
    reaction = @post.reactions.where(user: current_user).first_or_create
    reaction.kind = params[:kind]
    reaction.save
  end

protected
  def create_post_params
    params.require(:post).permit(:title, :content, :tag_string)
  end

  def update_post_params
    params.require(:post).permit(:title, :content, :tag_string)
  end

  def require_post
    @post = @blog.posts.find_by_id(params[:id] || params[:post_id])

    unless @post
      flash[:error] = "Cannot find post 😅"
      redirect_to blog_posts_path(@blog)
    end
  end
end
