class Payment < ActiveRecord::Base
    belongs_to :credit
    has_many :receipts
    has_many :tickets
    def pagado
        if self.total_pagado.to_f >= self.importe.to_f
             self.update_attributes(:estatus => 2)
             return true
         else
            return false
        end
    end
    def total_pagado
        Ticket.where(payment_id:self.id).sum(:cantidad)
    end
    def activo
        self.credit.payments.each do |tk|
            puts tk.id
            unless tk.pagado
                if tk.id == self.id
                    return true
                else
                    return false
                end
            end
                
        end
    end
   
    # 0 ------ al corriente
    # 1 ------ Vencido
    # 2 ------ pagado
    
end
