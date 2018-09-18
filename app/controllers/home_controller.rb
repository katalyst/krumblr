class HomeController < ApplicationController
  def index
    @blogs = Blog.includes(:user)
  end
end
