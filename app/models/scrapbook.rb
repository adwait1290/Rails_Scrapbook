class Scrapbook < ActiveRecord::Base
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :users, through: :favorites
	has_many :book_attachments, dependent: :destroy
	accepts_nested_attributes_for :book_attachments, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].blank?}
end