class User < ActiveRecord::Base
	has_secure_password
	has_many :images
	has_many :likes, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :user_attachments, dependent: :destroy;
	has_many :scrapbooks
	has_many :scrapbooks_favorited, through: :favorites, source: :scrapbook
	has_many :scrapbooks_friends, through: :friends, source: :scrapbooks
	has_many :images_liked, through: :likes, source: :book_attachment
	has_many :friendships, :foreign_key => "user_id", :class_name => "Friendship"
	has_many :friends, :through => :friendships
	has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"
	has_many :active_friends, -> { where(friendships: { accepted: true}) }, through: :friendships, source: :friend
    has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
    has_many :pending_friends, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :user
    has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :friendships, source: :friend
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence: true
  	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	before_save :email_lowercase

	def email_lowercase
		email.downcase!
	end

	def name
		self.first_name + self.last_name
	end
	def friendss
    	active_friends | received_friends
    end
    def pending
        pending_friends | requested_friendships
    end
    def favbooks
    	scrapbooks_favorited
    end

end
