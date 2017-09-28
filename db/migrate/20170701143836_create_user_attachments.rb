class CreateUserAttachments < ActiveRecord::Migration
  def change
    create_table :user_attachments do |t|
      t.integer :user_id
      t.string :image
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
