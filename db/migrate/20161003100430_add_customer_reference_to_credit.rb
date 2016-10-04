class AddCustomerReferenceToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :customer, :reference
  end
end
