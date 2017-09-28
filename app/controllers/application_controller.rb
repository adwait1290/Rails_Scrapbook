class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :current_user
	before_action :require_login

	private
	def require_login
		redirect_to "/sessions/new" unless session[:user_id]
	end
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	def user_logged_in 
		if @current_user
			redirect_to "/scrapbooks"
		end
	end
	helper_method :current_user
	helper_method :require_login
	helper_method :user_logged_in
end
