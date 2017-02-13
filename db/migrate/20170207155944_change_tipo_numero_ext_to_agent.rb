class ChangeTipoNumeroExtToAgent < ActiveRecord::Migration
  def up
    change_column :agents, :numero_exterior, :string
  end

  def down
    change_column :agents, :numero_exterior, :integer
  end
end
