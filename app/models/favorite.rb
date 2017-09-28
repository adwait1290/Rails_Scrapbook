class Favorite < ActiveRecord::Base
  belongs_to :scrapbook
  belongs_to :user
end
