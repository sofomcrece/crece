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
     :numero_de_meses_de_sueldo_para_prestamo,
     :loan_id,
     :payout_id,
     presence:true
     
     def fechas_de_impresion
          Payment.joins(:credit=>:product).select(:fecha_de_impresion).where("products.id = ?",self.id).uniq.where("payments.fecha_de_pago < ? ",Time.now + 1.month)
     end

end
