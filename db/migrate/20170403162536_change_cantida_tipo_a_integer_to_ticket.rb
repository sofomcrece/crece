class ChangeCantidaTipoAIntegerToTicket < ActiveRecord::Migration
  def up
    change_column :tickets, :cantidad, :decimal
  end
  def down
    change_column :tickets, :cantidad, :string
  end
end
