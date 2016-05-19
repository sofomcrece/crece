class AddBranchOfficeIdToAgent < ActiveRecord::Migration
  def change
    add_reference :agents, :branch_offices, index: true, foreign_key: true
  end
end
