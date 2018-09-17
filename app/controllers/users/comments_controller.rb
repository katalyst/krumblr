class Users::CommentsController < ApplicationController
	before_action :check_user_permission, except: [:new]
	before_action :set_user_redirect_to, only: [:new]

	def new
		@comment = Comment.new(post_id: params[:post_id], parent_id: params[:parent_id])
	end

	def create
		@comment = Comment.new(comment_params.merge(user_id: current_user.id))
		@comment.save
		@post = @comment.post
	end

	private
		def comment_params
			params.require(:comment).permit(:body, :post_id, :parent_id)
		end

		def set_user_redirect_to
			if current_user.blank?
				session["user_return_to"] = post_path(params[:post_id])
			end
		end		
end
