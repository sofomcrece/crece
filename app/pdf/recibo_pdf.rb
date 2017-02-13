class ReciboPdf < Prawn::Document
  def initialize(r)
    super(:margin => [0,0,0,0])
   @ticket=r
    text_content
  end
  def text_content
      
      des = 0
    rectangle [50,750+des], 500, 170
    
    image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45, :at => [70,740+des]
    draw_text  "FOLIO:  #{@ticket.id}",:size=>9, :at => [400,720+des]
    draw_text  "FECHA CARGO: #{@ticket.payment.fecha_de_pago}" ,:size=>9, :at => [400,710+des]
    draw_text  "SUCURSAL: #{@ticket.payment.credit.padre.branch_office.nombre}",:size=>9, :at => [400,700+des]
    draw_text  "AGENTE: #{@ticket.payment.credit.padre.clave}",:size=>9, :at => [400,690+des]

    
    draw_text  "Original ", :at => [400,730+des]
    
    draw_text  "RECIBO DE :#{@ticket.payment.fecha_de_pago} ",:size=>9, :at => [70,670+des]
    draw_text  "LA CANTIDAD DE:  #{Dinero.to_money(@ticket.cantidad)}",:size=>9, :at => [70,660+des]
    draw_text  "                     (#{I18n.with_locale(:es) { (@ticket.cantidad).to_i.to_words }})",:size=>9, :at => [70,650+des]
    draw_text  "POR CONCEPTO DE: PAGO O ABONO AL CARGO QUINCENAL #{@ticket.payment.recibo} CORRESPONDIENTE AL CREDITO",:size=>9, :at => [70,640+des]
    draw_text  "                  OTORGADO EL #{@ticket.payment.credit.fecha}",:size=>9, :at => [70,630+des]
    draw_text  "ATRASADO ACTUAL DE: #{"0"} ",:size=>9, :at => [70,620+des]
    
    draw_text  "_________________________", :at => [370,610+des]
    draw_text  "FIRMA CHEQUE RECIBIDO",:size=>8, :at => [400,600+des]
    
    
      des = -200
    rectangle [50,750+des], 500, 170
    
    image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45, :at => [70,740+des]
    draw_text  "FOLIO:  #{@ticket.id}",:size=>9, :at => [400,720+des]
    draw_text  "FECHA CARGO: #{@ticket.payment.fecha_de_pago}" ,:size=>9, :at => [400,710+des]
    draw_text  "SUCURSAL: #{@ticket.payment.credit.padre.branch_office.nombre}",:size=>9, :at => [400,700+des]
    draw_text  "AGENTE: #{@ticket.payment.credit.padre.clave}",:size=>9, :at => [400,690+des]

    
    draw_text  "Copia 1 ", :at => [400,730+des]
    
    draw_text  "RECIBO DE :#{@ticket.payment.fecha_de_pago} ",:size=>9, :at => [70,670+des]
    draw_text  "LA CANTIDAD DE:  #{Dinero.to_money(@ticket.cantidad)}",:size=>9, :at => [70,660+des]
    draw_text  "                     (#{I18n.with_locale(:es) { (@ticket.cantidad).to_i.to_words }})",:size=>9, :at => [70,650+des]
    draw_text  "POR CONCEPTO DE: PAGO O ABONO AL CARGO QUINCENAL #{@ticket.payment.recibo} CORRESPONDIENTE AL CREDITO",:size=>9, :at => [70,640+des]
    draw_text  "                  OTORGADO EL #{@ticket.payment.credit.fecha}",:size=>9, :at => [70,630+des]
    draw_text  "ATRASADO ACTUAL DE: #{"0"} ",:size=>9, :at => [70,620+des]
    
    draw_text  "_________________________", :at => [370,610+des]
    draw_text  "FIRMA CHEQUE RECIBIDO",:size=>8, :at => [400,600+des]
    
      des = -400
     rectangle [50,750+des], 500, 170
    
    image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45, :at => [70,740+des]
    draw_text  "FOLIO:  #{@ticket.id}",:size=>9, :at => [400,720+des]
    draw_text  "FECHA CARGO: #{@ticket.payment.fecha_de_pago}" ,:size=>9, :at => [400,710+des]
    draw_text  "SUCURSAL: #{@ticket.payment.credit.padre.branch_office.nombre}",:size=>9, :at => [400,700+des]
    draw_text  "AGENTE: #{@ticket.payment.credit.padre.clave}",:size=>9, :at => [400,690+des]

    
    draw_text  "Copia 2 ", :at => [400,730+des]
    
    draw_text  "RECIBO DE :#{@ticket.payment.fecha_de_pago} ",:size=>9, :at => [70,670+des]
    draw_text  "LA CANTIDAD DE:  #{Dinero.to_money(@ticket.cantidad)}",:size=>9, :at => [70,660+des]
    draw_text  "                     (#{I18n.with_locale(:es) { (@ticket.cantidad).to_i.to_words }})",:size=>9, :at => [70,650+des]
    draw_text  "POR CONCEPTO DE: PAGO O ABONO AL CARGO QUINCENAL #{@ticket.payment.recibo} CORRESPONDIENTE AL CREDITO",:size=>9, :at => [70,640+des]
    draw_text  "                  OTORGADO EL #{@ticket.payment.credit.fecha}",:size=>9, :at => [70,630+des]
    draw_text  "ATRASADO ACTUAL DE: #{"0"} ",:size=>9, :at => [70,620+des]
    
    draw_text  "_________________________", :at => [370,610+des]
    draw_text  "FIRMA CHEQUE RECIBIDO",:size=>8, :at => [400,600+des]
    
  
    stroke
  end
end
