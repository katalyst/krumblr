class DashboardController < ApplicationController
  def index
    @posts = Post.recent_first.with_reactions
    # This will get very big very quickly.
    # Eventually will need to add some kind of paging + infite scroll
  end
end
