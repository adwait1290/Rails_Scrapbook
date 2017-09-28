class BookAttachment < ActiveRecord::Base
	belongs_to :user
	belongs_to :scrapbook
	has_many :likes, dependent: :destroy
	has_many :users, through: :likes
	mount_uploader :image, ImageUploader, dependent: :destroy
end
