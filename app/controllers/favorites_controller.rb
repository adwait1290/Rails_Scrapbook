class FavoritesController < ApplicationController
	def create
	Favorite.create favorite_params 
		redirect_to ""
	end

	def destroy
		@favorite = Favorite.find(params[:id])
		@favorite.destroy if current_user === @favorite.user
		redirect_to :back
	end
	private
		def favorite_params
			params.require(:favorite).permit(:scrapbook_id).merge(user: current_user)
		end
end

