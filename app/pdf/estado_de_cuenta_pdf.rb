class EstadoDeCuentaPdf < Prawn::Document
  def initialize(r,fechas)
    super(:margin => [50,50,50,50])
    @customer=r
    @f1 = fechas[0]
    @f2 = fechas[1]
    @credits = @customer.credits.select(:id,:monto_solicitud,:fecha_de_contrato,:product_id)
    @credits  = @credits.select(:id).where("credits.fecha_de_contrato > ?",@f1.to_date) unless @f1.nil?
    @credits  = @credits.select(:id).where("credits.fecha_de_contrato < ?",@f2.to_date) unless @f2.nil?
    text_content
  end
  def text_content
    base_size = 9
    contador = 0
    @credits.each do |credit| 
      payments = credit.payments.order(:fecha_de_pago)
      image "#{Rails.root}/app/assets/images/logo marjo.png", width: 220, height: 30,position: :right
      text  "FINANCIERA MARJO SA DE CV SOFOM ENR",:size=>base_size+4
      text  "#{Conf.last.domicilio}",:size=>base_size
      text  "CULIACAN DE ROSALES, SINALOA C.P. 80128",:size=>base_size
      text  "R.F.C. #{Conf.last.RFC}",:size=>base_size
      text  "Telefonos: #{Conf.last.telefono}",:size=>base_size
      text  "____________________________________________________________________________"
      table([ ["No. de cliente : #{@customer.id}", "Fecha de apertura: #{Auxiliar.fecha_natural(credit.fecha_de_contrato)}"],
           ["Cliente : #{@customer.nombre_completo_deudor}", "Fecha de vencimiento: #{Auxiliar.fecha_natural(payments.last.fecha_de_pago)}"],
           ["Cuenta : #{credit.id}", "Capital Concedido: #{Dinero.to_money credit.monto_solicitud}"],
           ["Periodo : Del #{(@f1.nil?)? "Inicio " : Auxiliar.fecha_natural(@f1) } al","Plazo pactado: #{credit.product.numero_de_pagos_a_realizar } #{credit.product.payout.periocidad}"],
           [" #{(@f2.nil?)? "Fin " : Auxiliar.fecha_natural(@f2)}","Periocidad: #{credit.product.payout.periocidad}"],
           [" ","Tasa de Interes: #{credit.product.taza_de_interes_ordinaria}%"]
           ],:cell_style => {:border_width => 0, :padding => [0, 20, 0, 0],:size => base_size})
           text "Detalle Saldo"
      text  "____________________________________________________________________________"
      capital = credit.getAPagar/(1 + (credit.product.taza_de_interes_ordinaria / 100))
      interes = credit.getAPagar - capital
      table([
        ["Capital pagado: #{Dinero.to_money credit.capital_pagado}","Capital Vencido: #{Dinero.to_money credit.capital_vencido}","Saldo Actual: #{Dinero.to_money credit.saldo_actual}"],
        ["Interes pagado: #{Dinero.to_money credit.interes_pagado}","Interes Vencido: #{Dinero.to_money credit.interes_vencido}","Fecha Limite de Pago: #{Auxiliar.fecha_natural(credit.payments.order(:fecha_de_pago).last.fecha_de_pago)}"],
        ["Comisiones pagado: 0","Interes Moratorio: #{Dinero.to_money credit.interes_moratorio}","Pago Quincenal : #{Dinero.to_money credit.payments.last.importe}"],
        ["","Capital a pagar: #{Dinero.to_money capital}",""],
        ["","Interes a pagar:#{Dinero.to_money interes} ",""]
        
        ],:cell_style => {:border_width => 0, :padding => [0, 10, 0, 0],:size => base_size})
      text  "Detalle Movimientos"
      text  "____________________________________________________________________________"
      tickets = Ticket.joins(:payment=>:credit).where("credits.id = ? and tickets.status = 0",credit.id)
      arreglo = []
      arreglo << ["F. OPERACION","MOVIMIENTO","F. RECIBO","IMPORTE"]
      tickets.each do |ticket|
        fecha_payment = ticket.payment.fecha_de_pago
        fecha_ticket = ticket.updated_at
        arreglo << [Auxiliar.fecha_formato(fecha_ticket),"pago Capital",Auxiliar.fecha_formato(fecha_payment),Dinero.to_money(ticket.pago_capital)]
        arreglo << [Auxiliar.fecha_formato(fecha_ticket),"pago Interes",Auxiliar.fecha_formato(fecha_payment),Dinero.to_money(ticket.pago_interes_sin_iva)]
        arreglo << [Auxiliar.fecha_formato(fecha_ticket),"pago Iva",Auxiliar.fecha_formato(fecha_payment),Dinero.to_money(ticket.pago_iva)]
      end
      table(arreglo,:cell_style => {:border_width => 0, :padding => [0, 30, 0, 30],:size => base_size})
      start_new_page
    end
  end
end
