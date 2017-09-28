class AddDefaultValueToAcceptedAttribute < ActiveRecord::Migration
  def up
  	change_column :friendships, :accepted, :boolean, default: true
  end
  def down
  	change_column :friendships, :accepted, :boolean, default: nil
  end
end
