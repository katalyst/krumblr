class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	protect_from_forgery with: :null_session

	def check_user_permission
		authenticate_user!
	end
	
	protected
		def after_sign_in_path_for(resource)
			request.env['omniauth.origin'] || stored_location_for(resource) || root_path
		end
end
