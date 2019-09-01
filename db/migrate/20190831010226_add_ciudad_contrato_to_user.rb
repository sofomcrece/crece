class AddCiudadContratoToUser < ActiveRecord::Migration
  def change
    add_column :ciudad_contrato, :clave, :string
  end
end
