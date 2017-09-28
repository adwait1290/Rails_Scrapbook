class SessionsController < ApplicationController
	before_action :user_logged_in
	skip_before_action :user_logged_in, only: [:destroy]
	def new
	end
	skip_before_action :require_login
	def create
		@user = User.find_by_email(params[:user][:email])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			puts "man"
			redirect_to scrapbooks_path
		else
			puts "dah"
			flash[:error] = "Could not find a user with that email and password combination."
			redirect_to root_path
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:message] = "You have successfully logged out"
		redirect_to root_path
	end
end
