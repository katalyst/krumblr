class DashboardController < ApplicationController
  def index
    @posts = Post.recent_first
  end
end
