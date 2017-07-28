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
        Ticket.where(payment_id:self.id).where(status:0).sum(:cantidad)
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
    def cargar_interes
        unless self.estatus==2
            inter =  self.importe * (self.credit.product.taza_de_interes_moratoria.to_f/100)
            self.update(interes:inter)
        end
        
    end
    def get_last_generated
        return self.tickets.where(status:1).last
    end
    # 0 ------ al corriente
    # 1 ------ Vencido
    # 2 ------ pagado

end
