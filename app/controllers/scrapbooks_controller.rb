class ScrapbooksController < ApplicationController
	before_action :set_scrapbook, only: [:show, :edit, :update, :destroy]
	
	def index
		@num = @current_user.id
		@allbooks = Scrapbook.all
		User.find(@num).scrapbooks_friends
		puts "******************"
		puts @allbooks
		@scrapbooks = current_user.scrapbooks
		@favbooks = current_user.favbooks
	end
	def new
		@scrapbook = Scrapbook.new
		@book_attachments = @scrapbook.book_attachments.build
	end

	def show
		@book_attachments = BookAttachment.all.where("scrapbook_id = ?", @scrapbook.id)

	end
	def edit
	end

	def update
		@scrapbook = Scrapbook.find(params[:scrapbook_id])
		if @scrapbook
			if @scrapbook.update(scrapbook_params)
				redirect_to(scrapbooks_path)
				flash[:message] = "Scrapbook successfully updated"
			end
		end
	end
	def destroy
		@scrapbook.destroy
		redirect_to scrapbooks_path
	end

	def create
		@scrapbook = Scrapbook.new(scrapbook_params)

		respond_to do |format|
			if @scrapbook.save

				puts "***********"
				puts params[:scrapbook][:book_attachments]
				params[:scrapbook][:book_attachments]['image'].each do |a|
					puts a
					@book_attachment = @scrapbook.book_attachments.create!(:image => a, :scrapbook_id => @scrapbook.id)
				end
				format.html { redirect_to @scrapbook, notice: "Scrapbook was successfully created."}
			else
				format.html { render action: "new"}
			end
		end
	end
	private
    # Use callbacks to share common setup or constraints between actions.
    def set_scrapbook
      @scrapbook = Scrapbook.find(params[:id])
    end
    def check_friends
    	unless (User.find(@scrapbook.user.id).friends.include?(@current_user) || @scrapbook.user.id == @current_user.id)
   			flash[:error] = "You must be friends with this user."
    		redirect_to "/scrapbooks"
    	end
    end
	def scrapbook_params
		params.require(:scrapbook).permit(:title, :description, :location, :book_attachments).merge(user: current_user)
	end
end

