class AddInfoToChecks < ActiveRecord::Migration
  def change
    add_column :checks, :followers_added, :text
    add_column :checks, :followers_removed, :text
    add_column :checks, :following_added, :text
    add_column :checks, :following_removed, :text
  end
end
