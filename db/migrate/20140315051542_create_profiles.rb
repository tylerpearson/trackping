class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.text :description
      t.string :avatar_url

      t.timestamps
    end
  end
end
