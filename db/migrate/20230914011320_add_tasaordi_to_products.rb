class AddTasaordiToProducts < ActiveRecord::Migration
  def change
    add_column :products, :tasaord, :float
  end
end
