class ApplicationController < ActionController::Base

    # Added below methods to restrict app access until after successful login
    helper_method :current_user 
    def current_user 
        @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    end

    def require_user 
        redirect_to '/login' unless current_user 
    end
end
