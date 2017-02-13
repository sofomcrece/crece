class ChangeTipoNumeroExtToBranchOffice < ActiveRecord::Migration
  def up
    change_column :branch_offices, :no_ext, :string
  end

  def down
    change_column :branch_offices, :no_ext, :integer
  end
end
