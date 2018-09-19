class ApplicationController < ActionController::Base
  def check_user_authority_on_blog
    unless current_user.can_access?(@blog)
      flash[:notice] = 'Sorry you are not authorised to access this resource'
      redirect_to blogs_path
    end
  end
end
