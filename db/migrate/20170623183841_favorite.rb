class Favorite < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :scrapbook, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end