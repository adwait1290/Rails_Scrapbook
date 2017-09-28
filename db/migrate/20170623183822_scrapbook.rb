class Scrapbook < ActiveRecord::Migration
  def change
    create_table :scrapbooks do |t|
      t.string :title
      t.text :description
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end