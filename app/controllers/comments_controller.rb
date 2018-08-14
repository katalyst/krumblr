class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)
        if @comment.save! 
            flash[:success] = "New comment added!"
            redirect_back(fallback_location: root_path) 
        else
            flash[:error] = "Failed to add a new comment."
            redirect_back(fallback_location: root_path)
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:comment_text, :post_id, :user_id)
    end
end
