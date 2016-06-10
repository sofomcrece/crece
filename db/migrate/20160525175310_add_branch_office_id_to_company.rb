class AddBranchOfficeIdToCompany < ActiveRecord::Migration
  def change
    add_reference :company, :BranchOffice, index: true, foreign_key: true
  end
end
