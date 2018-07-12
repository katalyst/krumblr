class BlogsController < ApplicationController
    def show
        @blog = Blog.find(params[:id])
        @posts = @blog.posts
    end
end
