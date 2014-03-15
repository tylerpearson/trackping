class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :account_id
      t.text :following
      t.text :followers

      t.timestamps
    end
  end
end
