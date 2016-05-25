class AddBranchOfficeIdToCompany < ActiveRecord::Migration
  def change
    add_reference :companies, :BranchOffice, index: true, foreign_key: true
  end
end
