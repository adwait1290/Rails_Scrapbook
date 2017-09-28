class CreateLike < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :book_attachment, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
