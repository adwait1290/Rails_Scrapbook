class FriendsController < ApplicationController
    def index
        @users = User.all
        @user = @current_user
    end
    def create
        @friendship = @current_user.friendships.build(friend_id: params[:friend_id])

        @friendship.accepted = false
        if @friendship.save 
            flash[:notice] = "Friend Requested"
            redirect_to :back
        else
            flash[:error] = "Unable to Request Friend"
            redirect_to :back
        end
    end

    def update
        @friendship = Friendship.where("user_id = ? AND friend_id = ?", params[:id].to_i, @current_user.id).first
        puts @friendship.id
        f = Friendship.find(@friendship.id.to_i)
        puts f.accepted
        f.accepted = true
        if f.save
                puts f.accepted
                flash[:notice] = "Friend successfully accepted."
                redirect_to friends_path
                puts f.accepted
        else
            flash[:error] = "There was a problem accepting this request."
        end
    end

    def destroy
        @friendship1 = Friendship.where("user_id = ? AND friend_id = ?", params[:id].to_i, @current_user.id).first
        f = Friendship.find(@friendship1.id.to_i)
        if f.destroy
            flash[:notice] = "Removed Friendship"
            redirect_to friends_path
        else 
            flash[:error] = "There was a problem deleting this friend."
        end
    end
end
