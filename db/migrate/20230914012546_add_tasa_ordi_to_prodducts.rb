class AddTasaOrdiToProdducts < ActiveRecord::Migration
  def change
    add_column :products, :tasaordi, :float
  end
end
