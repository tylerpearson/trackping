class AddSlugToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :slug, :string
  end
end


class AddIndexToAccounts < ActiveRecord::Migration
  def change
    add_index :accounts, :slug, unique: true
  end
end
