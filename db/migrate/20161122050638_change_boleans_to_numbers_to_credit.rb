class ChangeBoleansToNumbersToCredit < ActiveRecord::Migration
  def up
    change_column :credits, :es_cliente, :integer
    change_column :credits, :agente_empresa, :integer
    change_column :credits, :familiar_con_prestamo, :integer
    change_column :credits, :sexo, :integer
  end

  def down
    change_column :credits, :es_cliente, :boolean
    change_column :credits, :agente_empresa, :boolean
    change_column :credits, :familiar_con_prestamo, :boolean
    change_column :credits, :sexo, :boolean
  end
end
