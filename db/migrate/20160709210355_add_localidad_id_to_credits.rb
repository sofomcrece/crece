class AddLocalidadIdToCredits < ActiveRecord::Migration
  def change
    add_reference :credits, :LocalidadCnbv, index: true, foreign_key: true
    add_reference :credits, :State, index: true, foreign_key: true
    add_reference :credits, :Country, index: true, foreign_key: true
  end
end
