class Friendship < ActiveRecord::Base
	validates :user, uniqueness: { scope: [:friend_id ] }
	belongs_to :user
	belongs_to :friend, class_name: "User"
	has_many :scrapbooks, through: :friend
	
end
