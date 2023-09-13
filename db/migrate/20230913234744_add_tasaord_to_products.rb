class AddTasaordToProducts < ActiveRecord::Migration
  def change
    add_column :products, :tasa_ord, :float
  end
end
