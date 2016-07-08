class AddNombreCompletoFamiliar1ToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :nombre_Completo_Familiar_2, :string
  end
end
