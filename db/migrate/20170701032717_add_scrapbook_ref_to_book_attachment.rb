class AddScrapbookRefToBookAttachment < ActiveRecord::Migration
  def change
    add_reference :book_attachments, :scrapbook, index: true, foreign_key: true
  end
end
