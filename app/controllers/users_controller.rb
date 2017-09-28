class UsersController < ApplicationController
    def new
    end
    skip_before_action :require_login
    def create
        @user = User.create user_params
        if @user.save
            session[:user_id] = @user.id
            redirect_to scrapbooks_path
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to :back
        end
    end 


    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            reset_session
            redirect_to "sessions/new"
        else
            redirect_to "/users/#{@user.id}/edit"
        end
    end
    def edit
    end

    def show
        @user = User.find(params[:id])
    end

    def update
        @user = current_user
        params[:user][:user_attachments]['image'].each do |a|
        @user_attachment = @user.user_attachments.create!(:image => a, :user_id => @current_user.id)
    end

        if @user.update user_params
            redirect_to "/users/#{@user.id}}"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to "/users/#{@user.id}/edit"
        end
    end
    private 
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :city, :state,:user_attachments)
    end
end
