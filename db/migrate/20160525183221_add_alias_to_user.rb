class AddAliasToUser < ActiveRecord::Migration
  def change
    add_column :users, :Alias, :string
  end
end
