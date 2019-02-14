class AddComisionApertToProduct < ActiveRecord::Migration
  def change
    add_column :products, :comision_apert, :decimal
  end
end
