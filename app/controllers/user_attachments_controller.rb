class UserAttachmentsController < ApplicationController
	before_action :set_user_attachment, only [:show, :edit, :update, :destroy]

	def index
		@user_attachments = UserAttachment.all
	end

	def show
		@user_attachment = UserAttachment.find_by_id(params[:id])
	end

	def new 
		@user_attachment = UserAttachment.new
	end

	def edit

	end

	def create
		@user_attachment = UserAttachment.new(user_attachment_params)
		
		respond_to do |format|
			if @user_attachment.save
				format.html { redirect_to @user_attachment, notice: "user attachment was successfully created."}
				format.json { render :show, status: :created, location: @user_attachment }
			else
				format.html { render :new }
				format.json { render json: @user_attachment.errors, status: :unprocessable_entity }
			end
		end
	end
	def update
		respond_to do |format|
			if @user_attachment.update(user_attachment_params)
				format.html { redirect_to @user_attachment.user, notice: "user attachment was successfully updated."}
				format.json { render :show, status: :ok, location: @user_attachment }
			else
				format.html { render :edit }
				format.json { render json: @user_attachment.errors, status: :unprocessable_entity }
			end
		end
	end
	def destroy
		@user_attachment.destroy
		respond_to do |format| 
			format.html { redirect_to user_attachments_url, notice: "user attachment was successfully destroyed."}
			format.json { head :no_content }
		end
	end
	private

	def set_user_attachment
		@user_Attachment = UserAttachment.find(params[:id])
	end

	def user_attachment_params
		params.require(:user_attachment).permit(:user_id, :image)
	end

end
