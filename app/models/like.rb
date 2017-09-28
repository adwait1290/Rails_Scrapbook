class Like < ActiveRecord::Base
	belongs_to :book_attachment
	belongs_to :user
end