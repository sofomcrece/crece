class AddCiudadContratoToUser < ActiveRecord::Migration
  def change
    add_column :users,:ciudad_contrato, :clave, :string
  end
end



