class ContratoMunicipalPdf < Prawn::Document
  def initialize(credit)
    super()
    @credit = credit 
    
    text_content
  end
  def text_content
        text "Original",:size =>8,:align  => :right
   text "CONTRATO DE APERTURA DE CRÉDITO Y GARANTÍA" , :align  => :center, :style=> :bold
   
   el_interes=@credit.monto_solicitud*(@credit.product.taza_de_interes_ordinaria/100)
   cap_mas_int= @credit.monto_solicitud + el_interes
   iva_del_interes=el_interes * 0.16
   com_por_apert=cap_mas_int * (6.75/100)
   
   
 
    monto_a_pagar= cap_mas_int + iva_del_interes + com_por_apert
    
    pago_parcial=monto_a_pagar/24
    
     text " "
    text " "
    text " "
    
    text "En la ciudad de #{@credit.padre.municipio}, a #{@credit.fecha_en_español} comparecieron para celebrar el presente contrato de crédito y garantía, por una parte el(la) #{Conf.last.representante_legal}, representante legal de FINANCIERA MARJO, S.A. de C.V. SOFOM, E.N.R., con domicilio en: #{Conf.last.domicilio} de la ciudad de  CULIACÁN, SINALOA  a quien en lo sucesivo se le denominará 'El Acreedor', y por otra parte el Sr(a) #{@credit.nombre_completo_deudor} con domicilio en #{@credit.domicilio } a quien en lo sucesivo se le denominará 'El Deudor', al tenor de las siguientes:",:size =>10,:align => :justify 
    
    text " "
    text "CLAUSULAS" , :align  => :center, :style=> :bold
     text " "
    
    text "PRIMERA: 'El Acreedor' ha convenido otorgar un crédito por la cantidad de  #{@credit.product.payout.periocidad}) y 'El Deudor' en este acto da en garantía un pagaré por el monto total del crédito. ",:size =>10,:align => :justify 
    text " "
    text "SEGUNDA: El importe que acepta y se obliga a pagar 'El Deudor', será el estipulado en RECIBO expedido por 'EL Acreedor' y las fechas de pago, serán las estipuladas en este contrato, dicho recibo será firmado por 'El Deudor' o por las personas por él autorizadas.",:size =>10,:align => :justify 
    text " "
    text "TERCERA: La entrega de los recursos a que se refiere la cláusula primera de este contrato se hará por transferencia electrónica al Deudor.",:size =>10,:align => :justify
    text " "
    text "CUARTA: 'El Deudor' se obliga a pagar al 'El Acreedor' Intereses ordinarios, los cuales se generarán de saldos insolutos del crédito a una tasa de intereses anual fija de 77.43%, en el entendido de que los intereses ordinarios se calcularán a partir de la fecha de disposición del saldo del crédito correspondiente y de devengarán diariamente, los intereses ordinarios que se hayan acumulado al vencer serán pagaderos los días del pago Quincenales de la fuente del empleo del 'El Deudor'. Los intereses ordinarios se calcularán sobre una base de un año de trescientos sesenta (360) días. Las fecha de corte para el cálculo de intereses serán los días Quincenales, para el caso de que el vencimiento coincida con un día no laborable estos se pagarán el día hábil inmediato posterior, esto para efectos de cobranza.",:size =>10,:align => :justify
    text " "
    text "QUINTA: En caso de incumplimiento de las obligaciones que se mencionan en la cláusula cuarta, las sumas vencidas del capital causarán  intereses moratorios desde el día siguiente al de su vencimiento y durante el tiempo y en la medida en que no se ha pagada correctamente, a una tasa de interés moratorio fija de 193.57 % anual, estos intereses se devengarán y vencerán diariamente. Los intereses moratorios se calcularán multiplicando el saldo vencido por la tasa de interés moratoria efectiva desde el día inmediato siguiente de su vencimiento hasta el de su pago total.",:size =>10,:align => :justify
    text " "
    text "SEXTA: 'El Acreedor' cobrará al 'El Deudor' una comisión por administración de cartera, dicha comisión se calculará con base en el monto total del crédito otorgado, por un porcentaje correspondiente al 6.75% del mismo. Los pagos de la comisión por administración de cartera se realizarán el cargo de forma quincenal.",:size =>10,:align => :justify
    text " Interes= #{el_interes},   cap_mas_int=#{cap_mas_int},  iva_Int=#{iva_del_interes},  com_apert=#{com_por_apert} "
    text "SEPTIMA: ‘El Deudor' se obliga a pagar a 'El Acreedor' la cantidad de $ #{monto_a_pagar}, (#{Dinero.to_words(monto_a_pagar)} pesos 00/100 M.N) en un plazo de 12 meses, mediante 24 pagos  quincenales contados a partir de la firma del presente contrato, mediante la siguiente forma: 24 pagos quincenales y consecutivos, cada uno de ellos  por la cantidad de $ #{pago_parcial}, (#{Dinero.to_words(pago_parcial)} pesos 00/100 M.N",:size =>10,:align => :justify
    text " "
    text "OCTAVA: ‘El Deudor' se obliga realizar los pagos Quincenales que se señala  en la cláusula séptima abonando a la cuenta bancaria No 0215861814, Banco el Bajío, en las fechas de vencimiento pactadas o en su caso a través del descuento en la nómina.",:size =>10,:align => :justify
    text " "
    text "NOVENA: Ambos partes convienen en que todo pago que realice 'El Deudor',  se aplique de la siguiente manera, intereses moratorios, gastos y comisiones, intereses ordinarios, que en su caso se hayan devengado y por último el pago al capital del crédito.",:size =>10,:align => :justify
    text " "
    text "DECIMA: A falta de pago puntual de cualquier recibo emitido por 'El Acreedor' de conformidad con la cláusula séptima, se dará por vencido este contrato debiendo 'El Acreedor' exigir a 'El Deudor':",:size =>10,:align => :justify
    text " "
    text "      A. Interés moratorios de 193.57 % por el importe de saldo insoluto vencido (mensual).",:size =>10,:align => :left 
    text "      B. Pago inmediato de la cantidad que como saldo total este adeudándole.",:size =>10,:align => :left 
    text "      C. La recisión de este contrato y por consiguiente, el pago de las prestaciones legales a que haya lugar.",:size =>10,:align => :left  
    text " "
    text "DECIMA PRIMERA: 'El Deudor' o las personas autorizadas por él, al firmar el recibo o el documento hacen constar que recibió el o los artículos descritos en su entera satisfacción. ",:size =>10,:align => :justify
    text " "
    text "DECIMA SEGUNDA: Para la interpretación del presente contrato, las partes se someten a lo que determinen los tribunales competentes de la ciudad de CULIACÁN, SINALOA, renunciando expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuro o de cualquier índole. ",:size =>10,:align => :justify
    text " "
    text "Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de __________________, __________________ el día ____ de _______________ de _________ . ",:size =>10,:align => :justify
    text " "
    text " "
    text " "
     text " "
    text " "
    text " "
    text "________________________ 		    	         		  __________________________" ,:size =>10,:align => :center
    text "         'EL ACREEDOR' 	                                   	 'EL DEUDOR'       ",:size =>10,:align => :center
   text " "
    text " "
    text " "
 text " "
    text " "
    text " "
     text " "
    text " "
    text " "

    text "* CAT (Costo Anual Total) ________________________ sin IVA.",:size =>8,:align => :left
    text "* Comisión Nacional para la Protección y Defensa de los Usuarios de Servicios Financieros (CONDUSEF)",:size =>8,:align => :left
    text "Tel. (55)5340 0999 y 01 800 999 8080 www.condusef.gob.mx",:size =>8,:align => :left
    text "*Registro de Contratos de Adhesión (RECA) Número:   __________________________________",:size =>8,:align => :left

  end
end
