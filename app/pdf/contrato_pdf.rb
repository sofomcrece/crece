class ContratoPdf < Prawn::Document
  def initialize(credit)
    super()
    @credit = credit 
    
    text_content
  end
  def text_content
   text "CONTRATO DE APERTURA DE CRÉDITO Y GARANTÍA      Original
   " , :align  => :center, :style=> :bold
      text "En la ciudad de __________________#{@credit.padre.municipio}__________________ , a #{@credit.fecha_en_español} comparecieron para celebrar el presente contrato de credito y garantía, por una parte el(la) __(#{@credit.tipo_padre})_____#{@credit.padre.nombre_completo}__________________, representante legal de FINANCIERA MARJO,S.A. de C.V.
     SOFOM, E.N.R., con domicilio en: ____#{@credit.padre.domicilio}_____ de la ciudad de ______#{@credit.padre.municipio}________ a quien en lo sucesivo se le denominará 'El Acreedor', y por
     otra parte el Sr(a) ________#{@credit.nombre_completo_deudor}________ con domicilio en ____ #{@credit.domicilio } ______ a quien en lo sucesivo se le denominará 'El Deudor', al tenor de las siguientes:
    ",:size =>10,:align => :justify 
    text "CLAUSULAS" , :align  => :center, :style=> :bold
    text "
    PRIMERA: 'El Acreedor' ha convenido en otorgar una línea de crédito a 'El Deudor' y este dá en garantia
    un pagaré por el monto total del crédito.
    SEGUNDA: El importe que acepta y se obliga a pagar 'El Deudor', será el estipulado en RECIBO expedido
    por 'EL Acreedor' y las fechas de pago, serán las estipuladas en este contrato, dicho recibo será
    firmado por 'El Deudor' o por las personas por él autorizadas.
     TERCERA: Cada recibo emitido por 'El Acreedor' deberá pagarse en un plazo no mayor a _#{@credit.product.numero_de_pagos_a_realizar/2}_ meses a partir
     de la fecha de su expedición, cuyo pago se efectuará mediante abonos ____#{@credit.product.payout.nombre}_______ por la cantidad
     de $ ___105.00___ por cada $1,000.00 que sea el préstamo, dando como ejemplo el siguiente tabulador." ,:size =>10 ,:align => :justify
     text "
    PRESTAMO          ABONO (quincenal )       
     _________        __________            
     1,000.00          105.00                             
     2,000.00          210.00                              
     3,000.00          315.00                             
     4,000.00          420.00                             
     " , :align  => :center,:size =>10
     text "
    * El tabulador que se despliega en el presente punto hace referencia a que el abono está condicionado a
     que por cada $1,000.00 de préstamo al cliente, deberá darse un abono por la cantidad de $ _____105.00___
     ___#{@credit.product.payout.nombre}__. La tasa de interes del préstamo es del #{@credit.product.taza_de_interes_ordinaria} %.
    Los recibos surtidos a 'El Acreedor' no deberán rebasar la línea de crédito establecida que es de
     $ ____10,000.00____.
    'El Acreedor' tiene en todo momento el derecho de negar cualquier pedido a 'El Deudor' cuando algún
     recibo se encuentre con más de _1_ días, independientemente de su adeudo será menor de $ ___10,000.00___
    'El Acreedor' tiene en todo momento el derecho de negar cualquier pedido a 'El Deudor' cuando su saldo
     sea mayor de $ ___10,000.00___, independientemente de su vencimiento.
    La línea de crédito otorgada jamás podrá exceder a la cantidad que resulte de 2 meses de sueldo que el
    cliente demuestre para la apertura del presente contrato de apertura de crédito.
    CUARTA: A falta de pago puntual de cualquier recibo emitido por 'El Acreedor' de conformidad con las
    segunda y tercera, se dará por vencido este contrato, y en consecuencia se suspenderá la linea de
    crédito, debiendo 'El Acreedor' exigir a 'El Deudor'
     A. Interes moratorios de _#{@credit.product.taza_de_interes_moratoria}__ por el importe de saldo insoluto vencido (mensual.
    B. Pago inmediato de la cantidad que como saldo total este adeudándole.
    C. La resición de este contrato y por consiguiente, el pago de las prestaciones legales a que haya
     lugar.
    QUINTA: 'El Deudor' o las peronas autorizadas por él, al firmar el recibo o el documento hacen constar
    que recibió el o los artuculos descritos en su entera satisfacción.
    SEXTA: Para la interpretación del presente contrato, las partes se someten a lo que determinen los
     tribunales competentes de la ciudad de __________#{@credit.padre.municipio}_____________, renunciando
    expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuros
    o de cualquier índole.
    Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de
     __________#{@credit.padre.municipio}_____________ el día de __#{Time.now.day}___ de ___#{Time.now.month}______ de __#{Time.now.year}__.
     ______________________________________________________________________________
     'EL ACREEDOR' 'EL DEUDOR'
    * CAT (Costo Anual Total) %#{@credit.product.cat_sin_iva} sin IVA.
    * Comisión Nacional para la Protección y Defensa de los Usuarios de Servicios Financieros (CONDUSEF)
     Tel. (55)5340 0999 y 01 800 999 8080 www.condusef.gob.mx
    * Registro de Contratos de Adhesión (RECA) Número: #{@credit.product.registro_del_contrado_de_adhesion}
    ",:size =>10,:align => :justify 
    
   text "CONTRATO DE APERTURA DE CRÉDITO Y GARANTÍA      Copia 1
   " , :align  => :center, :style=> :bold
      text "En la ciudad de __________________#{@credit.padre.municipio}__________________ , a #{@credit.fecha_en_español} comparecieron para celebrar el presente contrato de credito y garantía, por una parte el(la) __(#{@credit.tipo_padre})_____#{@credit.padre.nombre_completo}__________________, representante legal de FINANCIERA MARJO,S.A. de C.V.
     SOFOM, E.N.R., con domicilio en: ____#{@credit.padre.domicilio}_____ de la ciudad de ______#{@credit.padre.municipio}________ a quien en lo sucesivo se le denominará 'El Acreedor', y por
     otra parte el Sr(a) ________#{@credit.nombre_completo_deudor}________ con domicilio en ____ #{@credit.domicilio } ______ a quien en lo sucesivo se le denominará 'El Deudor', al tenor de las siguientes:
    ",:size =>10,:align => :justify 
    text "CLAUSULAS" , :align  => :center, :style=> :bold
    text "
    PRIMERA: 'El Acreedor' ha convenido en otorgar una línea de crédito a 'El Deudor' y este dá en garantia
    un pagaré por el monto total del crédito.
    SEGUNDA: El importe que acepta y se obliga a pagar 'El Deudor', será el estipulado en RECIBO expedido
    por 'EL Acreedor' y las fechas de pago, serán las estipuladas en este contrato, dicho recibo será
    firmado por 'El Deudor' o por las personas por él autorizadas.
     TERCERA: Cada recibo emitido por 'El Acreedor' deberá pagarse en un plazo no mayor a ___ meses a partir
     de la fecha de su expedición, cuyo pago se efectuará mediante abonos __________________ por la cantidad
     de $ __________ por cada $1,000.00 que sea el préstamo, dando como ejemplo el siguiente tabulador." ,:size =>10 ,:align => :justify
     text "
    PRESTAMO          ABONO ( )       
     _________        __________            
     1,000.00                                       
     2,000.00                                       
     3,000.00                                       
     4,000.00                                       
     " , :align  => :center,:size =>10
     text "
    * El tabulador que se despliega en el presente punto hace referencia a que el abono está condicionado a
     que por cada $1,000.00 de préstamo al cliente, deberá darse un abono por la cantidad de $ _____________
     ______________. La tasa de interes del préstamo es del % #{@credit.product.taza_de_interes_ordinaria}.
    Los recibos surtidos a 'El Acreedor' no deberán rebasar la línea de crédito establecida que es de
     $ _______________.
    'El Acreedor' tiene en todo momento el derecho de negar cualquier pedido a 'El Deudor' cuando algún
     recibo se encuentre con más de ____ días, independientemente de su adeudo será menor de $ _____________
    'El Acreedor' tiene en todo momento el derecho de negar cualquier pedido a 'El Deudor' cuando su saldo
     sea mayor de $ ______________, independientemente de su vencimiento.
    La línea de crédito otorgada jamás podrá exceder a la cantidad que resulte de 2 meses de sueldo que el
    cliente demuestre para la apertura del presente contrato de apertura de crédito.
    CUARTA: A falta de pago puntual de cualquier recibo emitido por 'El Acreedor' de conformidad con las
    segunda y tercera, se dará por vencido este contrato, y en consecuencia se suspenderá la linea de
    crédito, debiendo 'El Acreedor' exigir a 'El Deudor'
     A. Interes moratorios de _#{@credit.product.taza_de_interes_moratoria}__ por el importe de saldo insoluto vencido (mensual.
    B. Pago inmediato de la cantidad que como saldo total este adeudándole.
    C. La resición de este contrato y por consiguiente, el pago de las prestaciones legales a que haya
     lugar.
    QUINTA: 'El Deudor' o las peronas autorizadas por él, al firmar el recibo o el documento hacen constar
    que recibió el o los artuculos descritos en su entera satisfacción.
    SEXTA: Para la interpretación del presente contrato, las partes se someten a lo que determinen los
     tribunales competentes de la ciudad de __________#{@credit.padre.municipio}_____________, renunciando
    expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuros
    o de cualquier índole.
    Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de
     ______________________________________________ el día de _____ de _________________ de ______.
     ______________________________________________________________________________
     'EL ACREEDOR' 'EL DEUDOR'
    * CAT (Costo Anual Total) %#{@credit.product.cat_sin_iva} sin IVA.
    * Comisión Nacional para la Protección y Defensa de los Usuarios de Servicios Financieros (CONDUSEF)
     Tel. (55)5340 0999 y 01 800 999 8080 www.condusef.gob.mx
    * Registro de Contratos de Adhesión (RECA) Número: #{@credit.product.registro_del_contrado_de_adhesion}
    ",:size =>10,:align => :justify 
    
    
   text "CONTRATO DE APERTURA DE CRÉDITO Y GARANTÍA      Copia 2
   " , :align  => :center, :style=> :bold
      text "En la ciudad de __________________#{@credit.padre.municipio}__________________ , a #{@credit.fecha_en_español} comparecieron para celebrar el presente contrato de credito y garantía, por una parte el(la) __(#{@credit.tipo_padre})_____#{@credit.padre.nombre_completo}__________________, representante legal de FINANCIERA MARJO,S.A. de C.V.
     SOFOM, E.N.R., con domicilio en: ____#{@credit.padre.domicilio}_____ de la ciudad de ______#{@credit.padre.municipio}________ a quien en lo sucesivo se le denominará 'El Acreedor', y por
     otra parte el Sr(a) ________#{@credit.nombre_completo_deudor}________ con domicilio en ____ #{@credit.domicilio } ______ a quien en lo sucesivo se le denominará 'El Deudor', al tenor de las siguientes:
    ",:size =>10,:align => :justify 
    text "CLAUSULAS" , :align  => :center, :style=> :bold
    text "
    PRIMERA: 'El Acreedor' ha convenido en otorgar una línea de crédito a 'El Deudor' y este dá en garantia
    un pagaré por el monto total del crédito.
    SEGUNDA: El importe que acepta y se obliga a pagar 'El Deudor', será el estipulado en RECIBO expedido
    por 'EL Acreedor' y las fechas de pago, serán las estipuladas en este contrato, dicho recibo será
    firmado por 'El Deudor' o por las personas por él autorizadas.
     TERCERA: Cada recibo emitido por 'El Acreedor' deberá pagarse en un plazo no mayor a ___ meses a partir
     de la fecha de su expedición, cuyo pago se efectuará mediante abonos __________________ por la cantidad
     de $ __________ por cada $1,000.00 que sea el préstamo, dando como ejemplo el siguiente tabulador." ,:size =>10 ,:align => :justify
     text "
    PRESTAMO          ABONO ( )       
     _________        __________            
     1,000.00                                       
     2,000.00                                       
     3,000.00                                       
     4,000.00                                       
     " , :align  => :center,:size =>10
     text "
    * El tabulador que se despliega en el presente punto hace referencia a que el abono está condicionado a
     que por cada $1,000.00 de préstamo al cliente, deberá darse un abono por la cantidad de $ _____________
     ______________. La tasa de interes del préstamo es del #{@credit.product.taza_de_interes_ordinaria} %.
    Los recibos surtidos a 'El Acreedor' no deberán rebasar la línea de crédito establecida que es de
     $ _______________.
    'El Acreedor' tiene en todo momento el derecho de negar cualquier pedido a 'El Deudor' cuando algún
     recibo se encuentre con más de ____ días, independientemente de su adeudo será menor de $ _____________
    'El Acreedor' tiene en todo momento el derecho de negar cualquier pedido a 'El Deudor' cuando su saldo
     sea mayor de $ ______________, independientemente de su vencimiento.
    La línea de crédito otorgada jamás podrá exceder a la cantidad que resulte de 2 meses de sueldo que el
    cliente demuestre para la apertura del presente contrato de apertura de crédito.
    CUARTA: A falta de pago puntual de cualquier recibo emitido por 'El Acreedor' de conformidad con las
    segunda y tercera, se dará por vencido este contrato, y en consecuencia se suspenderá la linea de
    crédito, debiendo 'El Acreedor' exigir a 'El Deudor'
     A. Interes moratorios de _#{@credit.product.taza_de_interes_moratoria}__ por el importe de saldo insoluto vencido (mensual.
    B. Pago inmediato de la cantidad que como saldo total este adeudándole.
    C. La resición de este contrato y por consiguiente, el pago de las prestaciones legales a que haya
     lugar.
    QUINTA: 'El Deudor' o las peronas autorizadas por él, al firmar el recibo o el documento hacen constar
    que recibió el o los artuculos descritos en su entera satisfacción.
    SEXTA: Para la interpretación del presente contrato, las partes se someten a lo que determinen los
     tribunales competentes de la ciudad de __________#{@credit.padre.municipio}_____________, renunciando
    expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuros
    o de cualquier índole.
    Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de
     ______________________________________________ el día de _____ de _________________ de ______.
     ______________________________________________________________________________
     'EL ACREEDOR' 'EL DEUDOR'
    * CAT (Costo Anual Total) %#{@credit.product.cat_sin_iva} sin IVA.
    * Comisión Nacional para la Protección y Defensa de los Usuarios de Servicios Financieros (CONDUSEF)
     Tel. (55)5340 0999 y 01 800 999 8080 www.condusef.gob.mx
    * Registro de Contratos de Adhesión (RECA) Número: #{@credit.product.registro_del_contrado_de_adhesion}
    ",:size =>10,:align => :justify 
    
   
    
    text "PAGARÉ No._______ BUENO POR $ _________________
    En ___________________________ a ____ de ______________ de 20___
     Debo(emos) y pagaré(mos) incondicionalmente por este pagaré a la orden de _________________________
     _______________________________________________________ el ________________________________________
     Valor recibido a mi(nuestra) entera satisfacción. Este pagaré está sujeto a las condición de que al
     no pagarse a su vencimiento, será exigible desde la fecha de su vencimiento de este documento hasta
     el dia de su total liquidación, causando intereses moratorios al tipo de _____% mensual pagadero en
     esta ciudad juntamente con el principal.
     Nombre y datos de 'EL DEUDOR' Nombre y datos de 'EL AVAL'
     Nombre: ________________________________________ Nombre: ________________________________________
     Domicilio:_________________________Tel._________ Domicilio:_________________________Tel._________
     Acepto(amos) Acepto(amos)
     Firma(s)________________________________________ Firma(s)________________________________________",:size =>10,:align => :justify 
  end
end
