class CaratulaPdf < Prawn::Document
  def initialize(credit)
    super(:margin => [0,0,0,0])
    @credit = credit 
    text_content

  end
  def text_content
      xperiod = @credit.product.payout.periocidad.upcase
      if xperiod == "SEMANAL"
        xtasa = "36%"
      elsif
        xtasa = @credit.product.taza_de_interes_ordinaria
      end if
      image open("#{Rails.root}/app/pdf/caratula_credito.jpg"), position: :center , :width=>560, :height=>790
      draw_text  "#{@credit.product.nombre_del_producto}",:size=>9, :at => [190,685]
      draw_text  "#{@credit.product.loan.nombre}",:size=>9, :at => [140,666]
      draw_text  "#{'%.2f' % @credit.taza_ord}%",:size=>9, :at => [230,620]
      #draw_text  "#{'%.2f' % xtasa}%",:size=>9, :at => [230,620]
      #draw_text  "#{@credit.product.taza_de_interes_moratoria} %",:size=>9, :at => [230,610]
      draw_text  "120%",:size=>9, :at => [230,610]
     draw_text  "#{'%.2f' % @credit.cat_sin_iva}%",:size=>9, :at => [55 ,619]
      draw_text  "#{Dinero.to_money(@credit.monto_solicitud)}",:size=>9, :at => [340,610]
      draw_text  "#{Dinero.to_money((@credit.monto_solicitud.to_f + (@credit.monto_solicitud.to_f * (@credit.taza_ord/100))))}",:size=>9, :at => [440,610]
      #draw_text  "52 semanas",:size=>9, :at => [100,570]
      draw_text " #{@credit.product.numero_de_pagos_a_realizar} #{@credit.product.etiqueta_plural}",:size=>9, :at => [100,570]
      #draw_text  "Viernes",:size=>9, :at => [280,579]
      #draw_text  "     Miércoles ",:size=>9, :at => [260,570]
      draw_text  "Día #{Payout.array_to_text(@credit.product.payout.getDays)} de cada mes",:size=>9, :at => [280,579]
      draw_text  "#{Payout.array_to_text(@credit.product.payout.getFlow)} de cada #{@credit.product.payout.type_payout==0?"semana":@credit.product.payout.type_payout==1?"mes":"año"}",:size=>9, :at => [260,570]
      #draw_text  "#{@credit.product.taza_de_interes_moratoria}",:size=>9, :at => [175,501]
      draw_text  "#{Conf.last.domicilio}",:size=>9, :at => [100,232]
      draw_text  "#{Conf.last.telefono}",:size=>9, :at => [100,215]
      draw_text  "#{Conf.last.pagina}",:size=>9, :at => [140,203]
      draw_text  "#{Conf.last.correo}",:size=>8, :at => [390,217]
      
      draw_text  "#{@credit.product.registro_del_contrado_de_adhesion}",:size=>9, :at => [240,123]
  end
end
