class CorridaPdf < Prawn::Document
  def initialize(credit,arreglo)
    super()
    @credit = credit 
    @arreglo = arreglo
    text_content
  end
  
  def header
    #This inserts an image in the pdf file and sets the size of the image
   
  end
  
  def text_content
   #monto_a_pagar= @credit.monto_solicitud*(1+(@credit.product.taza_de_interes_ordinaria/100))
   monto_a_pagar= @credit.monto_solicitud*(1+(@credit.taza_ord/100))
    image "#{Rails.root}/app/assets/images/logo crece.png", width: 155, height: 85
    text "TABLA DE AMORTIZACIÓN",:size =>10,:align => :left
    text "CRECE PRESTACIONES, S.A.P.I. DE C.V. SOFOM, E.N.R.",:size =>10,:align => :left
    text "RECA: #{@credit.product.registro_del_contrado_de_adhesion}",:size =>10,:align => :left
    table([
            ["NOMBRE: ",@credit.nombre_completo_deudor],
            ["FECHA DEL PRÉSTAMO: ",@credit.fecha_de_contrato.strftime("%d/%m/%Y")],
            ["MONTO DEL PRÉSTAMO: ",Dinero.to_money(@credit.monto_solicitud)],
            ["MONTO TOTAL A PAGAR: ",Dinero.to_money(monto_a_pagar)],
            ["PLAZO ", " #{@credit.product.numero_de_pagos_a_realizar} #{@credit.product.etiqueta_plural}"],  
            ["PERIODICIDAD", (@credit.product.payout.periocidad).upcase],
            ["TASA INTERES ORDINARIA ANUAL", @credit.product.taza_de_interes_ordinaria], 
            ["TASA INTERES MORATORIA ANUAL", "120%"], 
            ["CAT SIN IVA","#{'%.2f' % @credit.cat_sin_iva}%"]
            ],:cell_style => { size: 8 })
    
    move_down 20
    table(@arreglo,:cell_style => { size: 8 })
    text " "
    text "CUENTAS BANCARIAS PARA REALIZAR SUS PAGOS"
    text "A NOMBRE DE: CRECE PRESTACIONES, S.A.P.I. DE C.V., SOFOM, ENR"
    table([["BANCO","CUENTA","CLABE","No. TARJETA"]],:cell_style => { size: 8 })
    start_new_page 

    image "#{Rails.root}/app/assets/images/logo crece.png", width: 155, height: 85
    text "#{@credit.nombre_completo_deudor}"
    table([["FECHA DE PRESTAMO", @credit.fecha_de_contrato.strftime("%d/%m/%Y")], 
          ["MONTO PRESTAMO",Dinero.to_money(@credit.monto_solicitud)], 
          ["MONTO A PAGAR", Dinero.to_money(monto_a_pagar)], 
          ["PAGO FIJO", Dinero.to_money(monto_a_pagar/@credit.product.numero_de_pagos_a_realizar)], 
          ["TASA INTERES", @credit.product.taza_de_interes_ordinaria], 
          #["TASA INTERES","#{'%.2f' % @credit.taza_ord}%"], 
          ["PLAZO "," #{@credit.product.numero_de_pagos_a_realizar} #{@credit.product.etiqueta_plural}"],  
          ["PERIODICIDAD", (@credit.product.payout.periocidad).upcase], 
          ["CAT SIN IVA","#{'%.2f' % @credit.cat_sin_iva}%"]],:cell_style => { size: 8 })
    move_down 20
    table(@arreglo,:cell_style => { size: 8 })
    text " "
    text "CUENTAS BANCARIAS PARA REALIZAR SUS PAGOS"
    text "A NOMBRE DE: CRECE PRESTACIONES, S.A.P.I. DE C.V., SOFOM, ENR"
    table([["BANCO","CUENTA","CLABE","No. TARJETA"]],:cell_style => { size: 8 })
  end
end