class RemoveActividadEconomicaToCredit < ActiveRecord::Migration
  def change
    remove_column :credits, :actividad_Econimica, :integer
  end
end
