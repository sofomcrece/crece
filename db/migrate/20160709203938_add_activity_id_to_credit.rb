class AddActivityIdToCredit < ActiveRecord::Migration
  def change
    add_reference :credits, :EconomicalActivity, index: true, foreign_key: true
  end
end
