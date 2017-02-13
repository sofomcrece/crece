class ChangeTipoNumeroExtToCompany < ActiveRecord::Migration
  def up
    change_column :companies, :numero_exterior, :string
  end

  def down
    change_column :companies, :numero_exterior, :integer
  end
end
