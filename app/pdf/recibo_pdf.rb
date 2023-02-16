class ReciboPdf < Prawn::Document
  def initialize(r)
    super(:margin => [0,0,0,0])
    @tickets=r
    text_content
  end
  def text_content
    
    contador = 0
    @tickets.each do |ticket|  
      atrasados= ticket.payment.credit.payments.where(" payments.estatus = ?",1)
      at = 0
      if ticket.status==1 
        atrasados.each do |atrasado|
          at = at + atrasado.deuda_con_interes
        end
      end
      start_new_page unless contador ==0
        des = 0
      rectangle [50,750+des], 500, 190
      
      image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45, :at => [70,740+des]
      draw_text  "FOLIO:  2503616176B#{"0"*(5-ticket.id.to_s.length)+ticket.id.to_s}",:size=>9, :at => [420,720+des]
      draw_text  "FECHA CARGO: #{ticket.payment.fecha_de_pago}" ,:size=>9, :at => [420,705+des]
      draw_text  "SUCURSAL: #{ticket.payment.credit.padre.branch_office.nombre}",:size=>9, :at => [420,690+des]
      draw_text  "AGENTE: #{ticket.payment.credit.padre.nombre_completo}",:size=>9, :at => [420,675+des]
  
      
      draw_text  "ORIGINAL ",:size=>8, :at => [500,735+des]
      
      draw_text  "RECIBÍ DE : #{ticket.payment.credit.nombre_completo_deudor} ",:size=>9, :at => [70,665+des]
      draw_text  "LA CANTIDAD DE:  #{Dinero.to_money(ticket.cantidad)}",:size=>9, :at => [70,652+des]
      draw_text  "                     (#{(I18n.with_locale(:es) { (ticket.cantidad).to_i.to_words }).upcase } PESOS 00/100 M.N.)",:size=>9, :at => [70,639+des]
      draw_text  "POR CONCEPTO DE: PAGO O ABONO AL CARGO #{ticket.payment.credit.product.payout.periocidad} #{ticket.payment.recibo} CORRESPONDIENTE AL CREDITO",:size=>9, :at => [70,626+des]
      draw_text  "                  OTORGADO EL #{Auxiliar.fecha_formato(ticket.payment.credit.fecha_de_contrato)}",:size=>9, :at => [70,613+des]
      draw_text  "ATRASADO ACTUAL DE: #{Dinero.to_money at} ",:size=>9, :at => [70,600+des]
      
      draw_text  "_________________________", :at => [370,580+des]
      draw_text  "RECIBIÓ",:size=>8, :at => [430,594+des]
      draw_text "CUENTAS BANCARIAS PARA REALIZAR SUS PAGOS          A NOMBRE DE: FINANCIERA MARJO, S.A. DE C.V., SOFOM, ENR",:size=>7, :at => [70,570+des]
      draw_text "BANCO:           CUENTA               CLABE                                 No. TARJETA",:size=>7, :at => [70,562+des]
      draw_text "BANORTE:       0857315292         072730008573152921",:size=>7, :at => [70,554+des]
      draw_text "INBURSA:        50060343855       036730500603438554      4658 2858 0047 5869",:size=>7, :at => [70,546+des]
      draw_text "BAJIO:             112248540201     030730900002594213",:size=>7, :at => [70,538+des]
      
        des = -235
      rectangle [50,750+des], 500, 215
      
      
      image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45, :at => [70,740+des]
      draw_text  "FOLIO:  2503616176B#{"0"*(5-ticket.id.to_s.length)+ticket.id.to_s}",:size=>9, :at => [420,720+des]
      draw_text  "FECHA CARGO: #{ticket.payment.fecha_de_pago}" ,:size=>9, :at => [420,705+des]
      draw_text  "SUCURSAL: #{ticket.payment.credit.padre.branch_office.nombre}",:size=>9, :at => [420,690+des]
      draw_text  "AGENTE: #{ticket.payment.credit.padre.nombre_completo}",:size=>9, :at => [420,675+des]
  
      
      draw_text  "COPIA 1 ",:size=>8, :at => [500,735+des]
      
      draw_text  "RECIBÍ DE : #{ticket.payment.credit.nombre_completo_deudor} ",:size=>9, :at => [70,665+des]
      draw_text  "LA CANTIDAD DE:  #{Dinero.to_money(ticket.cantidad)}",:size=>9, :at => [70,652+des]
      draw_text  "                     (#{(I18n.with_locale(:es) { (ticket.cantidad).to_i.to_words }).upcase } PESOS 00/100 M.N.)",:size=>9, :at => [70,639+des]
      draw_text  "POR CONCEPTO DE: PAGO O ABONO AL CARGO #{ticket.payment.credit.product.payout.periocidad} #{ticket.payment.recibo} CORRESPONDIENTE AL CREDITO",:size=>9, :at => [70,626+des]
      draw_text  "                  OTORGADO EL #{Auxiliar.fecha_formato(ticket.payment.credit.fecha_de_contrato)}",:size=>9, :at => [70,613+des]
      draw_text  "ATRASADO ACTUAL DE: #{Dinero.to_money at} ",:size=>9, :at => [70,600+des]
      
      draw_text  "_________________________", :at => [370,580+des]
      draw_text  "RECIBIÓ",:size=>8, :at => [430,568+des]
      draw_text "CUENTAS BANCARIAS PARA REALIZAR SUS PAGOS          A NOMBRE DE: FINANCIERA MARJO, S.A. DE C.V., SOFOM, ENR",:size=>7, :at => [70,550+des]
      draw_text "BANCO:           CUENTA               CLABE                                 No. TARJETA",:size=>7, :at => [70,542+des]
      draw_text "BANORTE:       0857315292         072730008573152921",:size=>7, :at => [70,534+des]
      draw_text "INBURSA:        50060343855       036730500603438554      4658 2858 0047 5869",:size=>7, :at => [70,526+des]
      draw_text "BAJIO:             112248540201     030730900002594213",:size=>7, :at => [70,518+des]
      
        des = -475
      rectangle [50,750+des], 500, 190
      
      image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45, :at => [70,740+des]
      draw_text  "FOLIO:  2503616176B#{"0"*(5-ticket.id.to_s.length)+ticket.id.to_s}",:size=>9, :at => [420,720+des]
      draw_text  "FECHA CARGO: #{ticket.payment.fecha_de_pago}" ,:size=>9, :at => [420,705+des]
      draw_text  "SUCURSAL: #{ticket.payment.credit.padre.branch_office.nombre}",:size=>9, :at => [420,690+des]
      draw_text  "AGENTE: #{ticket.payment.credit.padre.nombre_completo}",:size=>9, :at => [420,675+des]
  
      
      draw_text  "COPIA 2 ",:size=>8, :at => [500,735+des]
      
      draw_text  "RECIBÍ DE : #{ticket.payment.credit.nombre_completo_deudor} ",:size=>9, :at => [70,665+des]
      draw_text  "LA CANTIDAD DE:  #{Dinero.to_money(ticket.cantidad)}",:size=>9, :at => [70,652+des]
      draw_text  "                     (#{(I18n.with_locale(:es) { (ticket.cantidad).to_i.to_words }).upcase } PESOS 00/100 M.N.)",:size=>9, :at => [70,639+des]
      draw_text  "POR CONCEPTO DE: PAGO O ABONO AL CARGO #{ticket.payment.credit.product.payout.periocidad} #{ticket.payment.recibo} CORRESPONDIENTE AL CREDITO",:size=>9, :at => [70,626+des]
      draw_text  "                  OTORGADO EL #{Auxiliar.fecha_formato(ticket.payment.credit.fecha_de_contrato)}",:size=>9, :at => [70,613+des]
      draw_text  "ATRASADO ACTUAL DE: #{Dinero.to_money at} ",:size=>9, :at => [70,600+des]
      
      draw_text  "_________________________", :at => [370,580+des]
      draw_text  "RECIBIÓ",:size=>8, :at => [430,568+des]
      draw_text "CUENTAS BANCARIAS PARA REALIZAR SUS PAGOS          A NOMBRE DE: FINANCIERA MARJO, S.A. DE C.V., SOFOM, ENR",:size=>7, :at => [70,550+des]
      draw_text "BANCO:           CUENTA               CLABE                                 No. TARJETA",:size=>7, :at => [70,542+des]
      draw_text "BANORTE:       0857315292         072730008573152921",:size=>7, :at => [70,534+des]
      draw_text "INBURSA:        50060343855       036730500603438554      4658 2858 0047 5869",:size=>7, :at => [70,526+des]
      draw_text "BAJIO:             112248540201     030730900002594213",:size=>7, :at => [70,518+des]
      stroke
      contador+=1
    end
  end
end
