class CreateBookAttachments < ActiveRecord::Migration
  def change
    create_table :book_attachments do |t|
      t.integer :book_id
      t.string :image

      t.timestamps null: false
    end
  end
end
