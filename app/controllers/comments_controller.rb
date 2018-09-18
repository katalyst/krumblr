class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_post, only: [:new, :create]

  def new
    @comment = Comment.new
  end

  def create
    new_comment_params = comment_params.merge(user_email: current_user.email)
    @comment = @post.comments.build(new_comment_params)

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  private
  
  def load_post
    @post = Post.find(params[:post_id])
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = 'Sorry this resource does not exit'
    redirect_to blogs_path
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
