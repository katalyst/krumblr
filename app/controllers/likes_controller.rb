class LikesController < ApplicationController
  def destroy
    likes = current_user.likes.where(post_id: like_params[:post_id])
    likes.each{|l| l.destroy}
    redirect_to blog_path(like_params[:blog_id])
  end

  def new
    Like.new(
      user: current_user,
      post: Post.find(like_params[:post_id])
    ).save
    redirect_to blog_path(like_params[:blog_id])
  end

  private
  def like_params
    params.permit(:post_id, :blog_id)
  end
end
