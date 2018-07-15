class UsersController < ApplicationController
    def index
        @new_blog = Blog.new
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @blogs = @user.blogs
    end
end
