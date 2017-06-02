class Ticket < ActiveRecord::Base
  belongs_to :payment
   after_initialize :defaults
    validates :cantidad, :payment_id ,  presence:true
    def defaults
      self.status  ||= 0
    end
    before_validation(on: :create) do
        if (self.payment.tickets.where(status:1).count>0 and self.status == 1) or self.payment.pagado
            false
        end
    end
end


#status
# 0 ----- aplicable
# 1 ------ generado por recibo (no aplicable)


=begin
flag = false
        if !(self.payment.tickets.count ==0)
            if self.payment.tickets.last.cantidad == self.payment.importe and self.payment.tickets.last.status==1 and  self.payment.importe== self.cantidad
                Ticket.transaction do
                    self.payment.tickets.last.update(status:0)
                end
                puts self.cantidad
                flag = true
            end
        end
=end        