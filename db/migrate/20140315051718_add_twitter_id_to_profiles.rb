class AddTwitterIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :twitter_id, :string
  end
end
