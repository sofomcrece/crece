class ChangeTipoNumeroExtToUser < ActiveRecord::Migration
  def up
    change_column :users, :numero_ext, :string
  end

  def down
    change_column :users, :numero_ext, :integer
  end
end
