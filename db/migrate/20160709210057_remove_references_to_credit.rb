class RemoveReferencesToCredit < ActiveRecord::Migration
  def change
    remove_column :credits, :pais_De_Nacimiento, :string
    remove_column :credits, :estado_Actual, :string
    remove_column :credits, :localidad, :string
  end
end
