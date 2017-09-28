class UserAttachment < ActiveRecord::Base
  mount_uploader :image, ImageUploader, dependent: :destroy
  belongs_to :user
end
