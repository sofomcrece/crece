class Product < ActiveRecord::Base
     has_many :branchOffices
     belongs_to :loan
     belongs_to :payout
     has_many :credits
     validates :nombre_del_producto,
     :registro_del_contrado_de_adhesion,
     :plazo_de_prestamo,
     :numero_de_pagos_a_realizar,
     :taza_de_interes_ordinaria,
     :taza_de_interes_moratoria,
     :cat_sin_iva,
     :plazo,
     :numero_de_meses_de_sueldo_para_prestamo,
     :loan_id,
     :payout_id,
     presence:true
     
     def fechas_de_impresion
          Payment.joins(:credit=>:product).select(:fecha_de_impresion).where("products.id = ?",self.id).uniq.where("payments.fecha_de_pago < ? ",Time.now + 1.month)
     end
     def fechas_de_corte
          Payment.select(:fecha_de_corte).joins(:credit=>:product).where("credits.status = ? ",1 ).where("products.id = ? ", self.id).uniq.order(:fecha_de_corte)
     end
     def ultimaFechaDeCorte
          fp = Payment.select(:fecha_de_pago,:fecha_de_corte).joins(:credit=>:product).where("credits.status = ? ",1 ).where("products.id = ? ", self.id).uniq.order(:fecha_de_pago)
          
          fp.reverse.each do |fechas|
               return fechas if fechas.fecha_de_corte.to_date <= Time.now.to_date
          end
     end
     def proximaFechaDeCorte
          fp = Payment.select(:fecha_de_pago,:fecha_de_corte).joins(:credit=>:product).where("credits.status = ? ",1 ).where("products.id = ? ", self.id).uniq.order(:fecha_de_pago)
          
          fp.each do |fechas|
               return fechas if fechas.fecha_de_corte.to_date > Time.now.to_date
          end
     end
     def vencer
          
     end
end
