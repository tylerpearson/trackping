class ChangeTwitterIdFormatInProfiles < ActiveRecord::Migration
  def self.up
   change_column :profiles, :twitter_id, :integer
  end

  def self.down
   change_column :profiles, :twitter_id, :string
  end
end
