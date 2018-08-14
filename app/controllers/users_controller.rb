class UsersController < ApplicationController
    # Added before_action to restrict app access until after successful login
    before_action :require_user, only: [:index, :show]
    
    def index
        @new_blog = Blog.new
        @users = User.all
        @user = User.friendly.find(current_user.id)
    end

    def new
        @user = User.new
    end

    def show
        @user = User.friendly.find(params[:id])
        @blogs = @user.blogs
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to '/' 
        else 
            redirect_to '/signup' 
        end 
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
