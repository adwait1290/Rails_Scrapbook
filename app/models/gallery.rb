class Gallery < ActiveRecord::Base
	belongs_to :user
	mount_uploaders :images, ImageUploader
	has_many :images
end
