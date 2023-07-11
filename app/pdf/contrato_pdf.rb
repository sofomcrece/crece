class ContratoPdf < Prawn::Document
  def initialize(credit)
    super()
    @credit = credit 
    
    text_content
  end
  def text_content

    text "RECA: xxxx-xxx-xxxxxx/xx-xxxxx-xxxx",:size =>10,:align => :right
    text " "
    text "Contrato de apertura de crédito personal que celebran por una parte Crece Prestaciones, S.A.P.I. de C.V., Sociedad Financiera de Objeto Múltiple, Entidad no Regulada, representada en este acto por el(la) señor(a) #{Conf.last.representante_legal} a quien en lo sucesivo se le denominará “LA ACREDITANTE, y por la otra parte el(la) Sr(a) #{@credit.nombre_completo_deudor} a quien en lo sucesivo se le denominará “EL ACREDITADO”, al tenor de las siguientes declaraciones y claúsulas:",:size =>10,:align => :justify
    text " "
    text "DECLARACIONES" , :align  => :center, :style=> :bold
    text " "
    text "I. DECLARA “LA ACREDITANTE” A TRAVÉS DE SU REPRESENTANTE:",:size =>10,:align => :justify, :style=> :bold 
    text " "
    text "A) Que es una sociedad mercantil constituida de conformidad con las leyes de los Estados Unidos Mexicanos, según consta en la escritura pública número 11936 volumen 276(doscientos setenta y seis) de fecha 26 de febrero del año 2020(dos mil veinte), otorgada ante la fé del licenciado Teresa Peña Gaspar notario público número 138(ciento treinta y ocho) del Estado de México, inscrita en el registro público de la propiedad y del comercio de Culiacán,  Sinaloa, bajo el folio mercantil numero N-2020019087." ,:size =>10 ,:align => :justify
    text " "
    text "B) Estar inscrita en el Registro Federal de Contribuyentes con la clave CPR20022645" , :align  => :justify,:size =>10       
    text " "
    text "C) Que tiene su domicilio en Río Nazas No. 1240, colonia Los Pinos, código postal 80128, Culiacán, Sinaloa."  , :align  => :justify,:size =>10          
    text " "
    text "D) Que para su constitución y operación con carácter de Sociedad Financiera de Objeto Múltiple Entidad no Regulada. no requiere de autorización de la Secretaria de Hacienda y Credito Público y únicamente está sujeta a la supervisión de La Comisión Nacional Bancaria y de Valores para efectos del artículo 56 de la Ley General de Organizaciones y Actividades Auxiliares del Crédito",:size =>10,:align => :justify 
    text " "
    text "E) Que el Sr(a) #{@credit.nombre_completo_deudor} tiene facultades para la celebración del presente contrato, según consta en la escritura pública número, de fecha #{@credit.fecha_en_español} y que dichas facultades no le han sido revocadas ni modificadas en forma alguna.",:size =>10,:align => :justify 
    text " "
    text "F) Que conforme a su objeto social, está interesada en otorgar a “EL ACREDITADO” un crédito por la cantidad, características y con las condiciones que más adelante se señalan, toda vez que la información que éste ha proporcionado a “LA ACREDITANTE” lo hace aparecer como persona solvente moral y económicamente y por lo tanto, sujeto de crédito.",:size =>10,:align => :justify 
    text " "
    text" DECLARA “EL ACREDITADO”:" ,:size =>10,:align => :justify, :style=> :bold 
    text " "
    text" A) Ser mexicano(a), mayor de edad, con capacidad legal suficiente para celebrar el contrato, obligándose consecuentemente a los términos del mismo.",:size =>10,:align => :justify 
    text " "
    text" B) Sus datos generales son los que han quedado asentados en la solicitud de crédito",:size =>10,:align => :justify 
    text " "
    text" C) Que previamente a la firma del presente contrato “LA ACREDITANTE”, le ha informado y explicado a “EL ACREDITADO” el contenido del mismo y de todos los documentos a suscribir , los cargos, comisiones y/o gastos que en su caso se generarán por su celebración y, en su caso, los descuentos o bonificaciones a que tiene derecho; así como que este producto no genera comisiones.",:size =>10,:align => :justify 
    text " "
    text" D) Que “LA ACREDITANTE” le informó el Costo Anual Total(CAT): el Costo Anual Total de Financimiento expresado en términos porcentuale anuales que, para fines informativos y de comparación, incorpora la totalidad de los costos y gastos inherentes a los créditos",:size =>10,:align => :justify 
    text " "
    text" E) Asimismo,  declara “EL ACREDITADO”  estar informado  de la facultad y derecho que tiene para consultar  el estado de cuenta del crédito objeto de este contrato, mismo que ha sido pactado por las partes, a la fecha de la última amortización según la tabla anexa en la cláusula novena, en la sucursal de “LA ACREDITANTE”  y que le proporcione una impresión del mismo, teniendo “EL ACREDITADO” un plazo de tres días hábiles para objetarlo y de no realizarlo se tendrá por conformado con el citado estado de cuenta para todos los efectos legales a que haya lugar.",:size =>10,:align => :justify 
    text " "
    text" F) Que  previo  a la firma  de este  contrato  ha firmado  el formato  de autorización  para  solicitar  reportes  de crédito  de personas físicas, a las sociedades de información crediticia que estime conveniente “LA ACREDITANTE”, el cual se anexa a este contrato y forma parte integrante del mismo, que se marca como anexo ___, así en este acto “EL ACREDITADO” reitera su entera voluntad de facultar a “LA ACREDITANTE”  para llevar a cabo investigaciones  sobre su comportamiento crediticio, a través de las consultas que se realicen en las sociedades de información crediticia que estime conveniente con una vigencia de tres años a partir de la firma de este contrato y en todo caso durante el tiempo que se mantenga la relación comercial y/o jurídica.",:size =>10,:align => :justify 
    text " "
    text" G) Que “EL ACREDITADO” conoce las penas en las que incurren las personas que declaran falsamente o haciendo creer a alguien la capacidad de pago que no se tiene, con el objeto de obtener un crédito a sabiendas de que no va a ser pagado o un lucro indebido y las sanciones de carácter penal que traen como consecuencia dicha conducta ilícita.",:size =>10,:align => :justify 
    text " "
    text" H) Que “LA ACREDITANTE” al momento de la firma del contrato le entregó un ejemplar del mismo, así como de todos sus anexos que forman parte integrante y/o suscribió los siguientes documentos: Carátula, misma que forma parte integrante del contrato. (Anexo 1) así como de la Tabla de Amortizaciones (Anexo 2).",:size =>10,:align => :justify 
    text " "
    text " Declarado lo anterior, las partes se obligan de conformidad con las siguientes:",:size =>10,:align => :justify
    text " "
    text " CLAÚSULAS",:size =>10,:align => :center, :style=> :bold
    text " "
    text "MONTO AUTORIZADO",:size =>10,:align => :left, :style=> :bold
    text "PRIMERA. El crédito autorizado por “LA ACREDITANTE” es el señalado en la carátula del presente contrato, como monto del crédito autorizado, que le otorgará a favor de “EL ACREDITADO”.",:size =>10,:align => :justify
    text " "
    text "En el importe del crédito o suerte principal no quedan comprendidos los intereses y demás erogaciones que se causen con motivo del presente contrato, los cuales son y serán a cargo de “EL ACREDITADO”.",:size =>10,:align => :justify
    text " "
    text "DISPOSICIÓN DEL CRÉDITO",:size =>10,:align => :left
    text "SEGUNDA. “EL ACREDITADO” dispondrá del importe del crédito, a la firma del presente contrato mediante cheque o mediante transferencia electrónica a la cuenta señalada por “EL ACREDITADO”, previa suscripción del (los) pagaré(s) respectivo(s), a favor de “LA ACREDITANTE”." ,:size =>10,:align => :justify
    text " "
    text "PAGOS, APLICACIÓN Y ADREDITAMIENTO",:size =>10,:align => :center, :style=> :bold
    text " "
    text "TERCERA. “EL ACREDITADO” se obliga a pagar a “LA ACREDITANTE”, sin necesidad de requerimiento alguno, el importe del crédito concedido mediante parcialidades de acuerdo a la tabla de amortización que forma parte integrante del presente contrato. “EL ACREDITADO” tendrá como fecha límite de pago los días señalados en la carátula. Cuando la fecha límite de pago sea en un día inhábil esta se recorrerá al siguiente día hábil, sin que proceda el cobro de penalizaciones y/o intereses moratorios.",:size =>10,:align => :justify
    text " "
    text "La periodicidad de los pagos será semanal de acuerdo a lo establecido en la tabla de amortización que forma parte integrante del presente contrato.",:size =>10,:align => :justify
    text " "
    text "“EL ACREDITADO” podrá realizar los pagos a través de depósitos y/o transferencia electrónica en cualquiera de las siguientes cuentas bancarias: cuenta número  del Banco , cuenta número del Banco  o bien podrá entregar el efectivo al representante de “LA ACREDITANTE”.",:size =>10,:align => :justify
    text " "
    text "El acreditamiento de los pagos referidos se verificará conforme a lo siguiente:",:size =>10,:align => :justify
    text " "
    text "A) Dinero en efectivo el mismo día en que sea recibido.",:size =>10,:align => :justify
    text " "
    text "B) Depósito y/o transferencia bancaria al día siguiente de reflejarse la misma en el estado de cuenta bancario de “LA ACREDITANTE”",:size =>10,:align => :justify
    text " "
    text "“LA ACREDITANTE” aplicará las cantidades que reciba en pago por orden de vencimiento conforme al orden siguiente:",:size =>10,:align => :justify
    text " "
    text "a) Impuesto al valor agregado;",:size =>10,:align => :justify
    text " "
    text "b) Intereses moratorios;",:size =>10,:align => :justify
    text " "
    text "c) Otros gastos y costas derivados del presente contrato;",:size =>10,:align => :justify
    text " "
    text "d) Intereses ordinarios;",:size =>10,:align => :justify
    text " "
    text "e) Capital vencido",:size =>10,:align => :justify
    text " "
    text "f) Capital vigente.",:size =>10,:align => :justify
    text " "
    text "En todo momento “EL ACREDITADO” podrá realizar pagos adelantados o anticipados.",:size =>10,:align => :justify
    text " "
    text "PAGOS ANTICIPADOS. “LA ACREDITANTE” se obliga a aceptar pagos anticipados de los créditos menores al equivalente a 900,000 UDIS, siempre que “EL ACREDITADO” lo solicite, esté al corriente con los pagos exigibles y el importe del pago anticipado sea por una cantidad igual o mayor al pago que deba realizarse en el periodo correspondiente. Los pagos que realice “EL ACREDITADO” antes de la fecha en que sea exigible, deberán de considerarse como pagos anticipados y no pago adelantado.",:size =>10,:align => :justify
    text " "
    text "Cuando “EL ACREDITADO” solicite efectuar pagos anticipados, “LA ACREDITANTE” le informará el saldo insoluto. Dicha información le será entregada por escrito si el pago anticipado se efectúa en alguna de sus sucursales o en su defecto vía telefónica.",:size =>10,:align => :justify
    text " "
    text "Los pagos anticipados se aplicarán en forma exclusiva al saldo insoluto de capital.",:size =>10,:align => :justify
    text " "
    text "Cuando el importe de los pagos anticipados no fuere suficiente para amortizar el saldo insoluto en su totalidad, “LA ACREDITANTE” deberá reducir el monto de los pagos periódicos pendientes, salvo cuando pacte con “EL ACREDITADO” que se disminuya el número de pagos a realizar. “LA ACREDITANTE” deberá calcular el importe de los intereses por devengar, con base en el nuevo saldo insoluto.",:size =>10,:align => :justify
    text " "
    text "Cada vez que “EL ACREDITADO” efectúe un pago anticipado, “LA ACREDITANTE” deberá entregarle un comprobante de dicho pago, así como la tabla de amortización correspondiente, junto con el estado de cuenta siguiente. Tratándose de pagos anticipados por un importe igual al saldo insoluto, “LA ACREDITANTE” además del comprobante del pago, deberá entregar o mantener a disposición de “EL ACREDITADO”, el estado de cuenta o documento en el que conste el fin de la relación contractual y la inexistencia de adeudos derivados exclusivamente de dicha relación, dentro de 10 (diez) días hábiles a partir de que se hubiera realizado el pago de los adeudos o en la siguiente fecha para cálculo de intereses que se indica en la carátula bajo el rubro “fecha de corte”.",:size =>10,:align => :justify
    text "Terminado el contrato, si llegara a existir saldo a favor de “EL ACREDITADO” este le será entregado en la fecha en que se dé por terminada la relación y en caso de que “EL ACREDITADO” no acuda a la sucursal, “LA ACREDITANTE” le informará que el saldo se encuentra a su disposición y le será devuelto mediante pago en ventanilla.",:size =>10,:align => :justify
    text "“LA ACREDITANTE” deberá reportar a las sociedades de información crediticia que la cuenta está cerrada sin adeudo alguno dentro del plazo que para tales efectos señala la ley para regular las sociedades de información crediticia.",:size =>10,:align => :justify
    text "PAGOS ADELANTADOS. “LA ACREDITANTE” podrá recibir pagos por adelantado con el fin de aplicarlos a cubrir pagos periódicos inmediatos siguientes del crédito, siempre que medie una solicitud por escrito de “EL ACREDITADO”. Cuando el importe del pago sea superior al que deba cubrirse en un periodo, “EL ACREDITADO” deberá de autorizar que los recursos que se entregan en exceso a sus obligaciones exigibles no se apliquen para el pago anticipado del principal, si no como pagos adelantados, lo anterior a través de un escrito con firma autógrafa que incluya la leyenda siguiente: el usuario autoriza que los recursos que se entregan en exceso a sus obligaciones exigibles, no se apliquen para pagos anticipados del principal, sino que se utilicen para cubrir por adelantado los pagos periódicos del crédito inmediatos siguientes.",:size =>10,:align => :justify
    text "Cuando “LA ACREDITANTE” reciba el pago aun no exigible del periodo o importes inferiores, no será necesario el escrito mencionado en el párrafo anterior.",:size =>10,:align => :justify
    text "Cada vez que “EL ACREDITADO” efectué un pago adelantado “LA ACREDITANTE” entregará o pondrá a disposición de este último, el estado de cuenta o documento en el que consté el pago adelantado y entregará el comprobante correspondiente.",:size =>10,:align => :justify
    text "Cuando la terminación del contrato sea por conducto de otra “ENTIDAD FINANCIERA” esta liquidará el adeudo de “EL ACREDITADO” de acuerdo a la información que proporcione “LA ACREDITANTE” y una vez cubiertos los adeudos esta última renuncia a todos los derechos de cobro remanente que pudieran subsistir después del momento de la cancelación.",:size =>10,:align => :justify
    text " "
    text "TASA DE INTERÉS ORDINARIA",:size =>10,:align => :justify
    text "CUARTA. “EL ACREDITADO” se obliga a pagar a “LA ACREDITANTE” intereses ordinarios sobre el monto del crédito a razón de una tasa fija del % (por ciento) anual, más IVA (Impuesto al Valor Agregado). Convienen las partes en que el interés que se aplique al importe financiero se calculará a partir de la fecha de firma del presente contrato, los mismos se pagarán en las fechas indicadas en la tabla de amortización. El pago de los intereses no podrá ser exigido por adelantado, sino únicamente por períodos vencidos.",:size =>10,:align => :justify
    text "Los intereses ordinarios se calcularán de acuerdo a la siguiente fórmula:",:size =>10,:align => :justify
    text "Multiplicando el monto del crédito autorizado por la tasa anual de interés ordinaria aplicable y el resultado se dividirá entre 360 (trescientos sesenta), obteniendo así el monto diario de interés",:size =>10,:align => :justify
    text "El interés diario se multiplicará por el número de días correspondientes del periodo del crédito.",:size =>10,:align => :justify
    text "La fecha de corte para el cálculo de los intereses se señala en la carátula, la cual forma parte integrante del presente contrato.",:size =>10,:align => :justify

    text "INTERESES MORATORIOS.",:size =>10,:align => :justify
    text "QUINTA. En caso de incumplimiento de la obligación de pago, según lo pactado en la cláusula tercera de este contrato el acreditado se obliga a pagar una tasa fija de interés moratorio del % anual, calculada diariamente sobre el capital devengado y no pagado, aplicable desde el día siguiente en que incurrió en mora y hasta el día en que se efectúe el pago total del adeudo.",:size =>10,:align => :justify
    text "Los intereses moratorios se calcularán de acuerdo a la siguiente fórmula:",:size =>10,:align => :justify
    text "Dividiendo la tasa fija anual de interés moratorio entre 360, lo cual dará como resultado la tasa diaria,",:size =>10,:align => :justify
    text "El interés diario se multiplica por el número de días que hayan transcurrido desde el día siguiente a la fecha de pago hasta el día en que se realice el pago (días vencidos) ",:size =>10,:align => :justify
    text "El resultado obtenido se multiplicará por el saldo vencido del crédito",:size =>10,:align => :justify

    text "OBLIGACIONES DE “EL ACREDITADO”.",:size =>10,:align => :justify
    text "SEXTA.  Además de las obligaciones contenidas en el presente instrumento, durante la vigencia del presente contrato, el acreditado se obliga a:",:size =>10,:align => :justify
    text "1. Hacer entrega de la copia de la ficha de depósito o comprobante de pago expedido por la institución de crédito, al representante de “LA ACREDITANTE”, al día siguiente hábil de su vencimiento.",:size =>10,:align => :justify
    text "2. Proporcionar en cualquier momento, durante la vigencia del crédito, la información que le sea requerida por “LA ACREDITANTE”.",:size =>10,:align => :justify


    start_new_page
    
    
    
   text"Copia 1",:size =>8,:align  => :right
   text "CONTRATO DE APERTURA DE CRÉDITO Y GARANTÍA      
   " , :align  => :center, :style=> :bold
 
  
      text "En la ciudad de #{@credit.padre.municipio}, a #{@credit.fecha_en_español} comparecieron para celebrar el presente contrato de credito y garantía, por una parte el(la) #{Conf.last.representante_legal}, representante legal de FINANCIERA MARJO, S.A. de C.V. SOFOM, E.N.R., con domicilio en: #{Conf.last.domicilio} de la ciudad de  CULIACÁN, SINALOA  a quien en lo sucesivo se le denominará 'El Acreedor', y por otra parte el Sr(a) #{@credit.nombre_completo_deudor} con domicilio en #{@credit.domicilio } a quien en lo sucesivo se le denominará 'El Deudor', al tenor de las siguientes:
",:size =>10,:align => :justify 
    text "CLAUSULAS" , :align  => :center, :style=> :bold
    text "PRIMERA: 'El Acreedor' ha convenido en otorgar una línea de crédito a 'El Deudor' y este dá en garantia un pagaré por el monto total del crédito. ",:size =>10,:align => :justify 
    text "SEGUNDA: El importe que acepta y se obliga a pagar 'El Deudor', será el estipulado en RECIBO expedido por 'EL Acreedor' y las fechas de pago, serán las estipuladas en este contrato, dicho recibo será firmado por 'El Deudor' o por las personas por él autorizadas.",:size =>10,:align => :justify 
    text "TERCERA: Cada recibo emitido por 'El Acreedor' deberá pagarse en un plazo no mayor a #{@credit.product.numero_de_pagos_a_realizar/2} meses a partir de la fecha de su expedición, cuyo pago se efectuará mediante abonos #{@credit.product.payout.periocidad} por la cantidad de $  #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/12)} por cada $1,000.00 que sea el préstamo, dando como ejemplo el siguiente tabulador." ,:size =>10 ,:align => :justify
    text "
                 PRÉSTAMO       ABONO (#{@credit.product.payout.periocidad})" , :align  => :center,:size =>10     
    text "_________         __________ "  , :align  => :center,:size =>10          
    text "1,000.00          #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)}   " , :align  => :center,:size =>10                            
    text " 2,000.00          #{Dinero.to_money((2000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 3,000.00          #{Dinero.to_money((3000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 4,000.00          #{Dinero.to_money((4000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
     text "
    * El tabulador que se despliega en el presente punto hace referencia a que el abono está condicionado a que por cada $1,000.00 de préstamo al cliente, deberá darse un abono por la cantidad de #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/12)} #{@credit.product.payout.periocidad}. La tasa de interes del préstamo es del #{'%.2f' % @credit.product.taza_de_interes_ordinaria} % #{@credit.product.plazo}.",:size =>10,:align => :justify 
    text" Los recibos surtidos a 'El Acreedor' no deberán rebasar la línea de crédito establecida que es de $ #{Dinero.to_money(@credit.monto_solicitud)}",:size =>10,:align => :justify 
    text" 'El Acreedor' tiene en todo momento el derecho de negar cualquier pedido a 'El Deudor' cuando algún recibo se encuentre con más de 1 días, independientemente de su adeudo será menor de $ #{Dinero.to_money(@credit.monto_solicitud)} " ,:size =>10,:align => :justify 
    text" 'El Acreedor' tiene en todo momento el derecho de negar cualquier pedido a 'El Deudor' cuando su saldo sea mayor de $ #{Dinero.to_money(@credit.monto_solicitud)}, independientemente de su vencimiento.",:size =>10,:align => :justify 
    text" La línea de crédito otorgada jamás podrá exceder a la cantidad que resulte de 2 meses de sueldo que el cliente demuestre para la apertura del presente contrato de apertura de crédito.",:size =>10,:align => :justify 
    text" CUARTA: A falta de pago puntual de cualquier recibo emitido por 'El Acreedor' de conformidad con las segunda y tercera, se dará por vencido este contrato, y en consecuencia se suspenderá la linea de crédito, debiendo 'El Acreedor' exigir a 'El Deudor'",:size =>10,:align => :justify 
    text" A. Interes moratorios de #{'%.2f' %  @credit.product.taza_de_interes_moratoria}% por el importe de saldo insoluto vencido (mensual).",:size =>10,:align => :justify 
    text" B. Pago inmediato de la cantidad que como saldo total este adeudándole.",:size =>10,:align => :justify 
    text" C. La resición de este contrato y por consiguiente, el pago de las prestaciones legales a que haya lugar.",:size =>10,:align => :justify 
    text" QUINTA: 'El Deudor' o las personas autorizadas por él, al firmar el recibo o el documento hacen constar que recibió el o los artículos descritos en su entera satisfacción.",:size =>10,:align => :justify 
    text" SEXTA: Para la interpretación del presente contrato, las partes se someten a lo que determinen los tribunales competentes de la ciudad de #{@credit.ciudad_tribunal}, renunciando expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuro o de cualquier índole.",:size =>10,:align => :justify 
    text" Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de #{@credit.padre.municipio}, #{@credit.padre.estado}  el día de #{@credit.fecha_en_español}.",:size =>10,:align => :justify 
    text"  __________________________                                                                          ________________________",:size =>10,:align => :justify 
    text"         'EL ACREEDOR'                                                                                                             'EL DEUDOR'",:size =>10,:align => :justify 
    text"
    "
   text" * CAT (Costo Anual Total) #{@credit.cat_sin_iva}% sin IVA.
    * Comisión Nacional para la Protección y Defensa de los Usuarios de Servicios Financieros (CONDUSEF)
     Tel. (55)5340 0999 y 01 800 999 8080 www.condusef.gob.mx
    * Registro de Contratos de Adhesión (RECA) Número: #{@credit.product.registro_del_contrado_de_adhesion}
    ",:size =>8,:align => :justify   
  start_new_page
    
    
   text"Copia 2",:size =>8,:align  => :right
   text "CONTRATO DE APERTURA DE CRÉDITO Y GARANTÍA      
   " , :align  => :center, :style=> :bold
 
  
     text "En la ciudad de #{@credit.padre.municipio}, a #{@credit.fecha_en_español} comparecieron para celebrar el presente contrato de credito y garantía, por una parte el(la) #{Conf.last.representante_legal}, representante legal de FINANCIERA MARJO, S.A. de C.V. SOFOM, E.N.R., con domicilio en: #{Conf.last.domicilio} de la ciudad de  CULIACÁN, SINALOA  a quien en lo sucesivo se le denominará 'El Acreedor', y por otra parte el Sr(a) #{@credit.nombre_completo_deudor} con domicilio en #{@credit.domicilio } a quien en lo sucesivo se le denominará 'El Deudor', al tenor de las siguientes:
",:size =>10,:align => :justify 
    text "CLAUSULAS" , :align  => :center, :style=> :bold
    text "PRIMERA: 'El Acreedor' ha convenido en otorgar una línea de crédito a 'El Deudor' y este dá en garantia un pagaré por el monto total del crédito. ",:size =>10,:align => :justify 
    text "SEGUNDA: El importe que acepta y se obliga a pagar 'El Deudor', será el estipulado en RECIBO expedido por 'EL Acreedor' y las fechas de pago, serán las estipuladas en este contrato, dicho recibo será firmado por 'El Deudor' o por las personas por él autorizadas.",:size =>10,:align => :justify 
    text "TERCERA: Cada recibo emitido por 'El Acreedor' deberá pagarse en un plazo no mayor a #{@credit.product.numero_de_pagos_a_realizar/2} meses a partir de la fecha de su expedición, cuyo pago se efectuará mediante abonos #{@credit.product.payout.periocidad} por la cantidad de $  #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/12)} por cada $1,000.00 que sea el préstamo, dando como ejemplo el siguiente tabulador." ,:size =>10 ,:align => :justify
    text "
                 PRÉSTAMO       ABONO (#{@credit.product.payout.periocidad})" , :align  => :center,:size =>10       
    text "_________         __________ "  , :align  => :center,:size =>10          
    text "1,000.00          #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)}   " , :align  => :center,:size =>10                            
    text " 2,000.00          #{Dinero.to_money((2000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 3,000.00          #{Dinero.to_money((3000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 4,000.00          #{Dinero.to_money((4000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
     text "
    * El tabulador que se despliega en el presente punto hace referencia a que el abono está condicionado a que por cada $1,000.00 de préstamo al cliente, deberá darse un abono por la cantidad de #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/12)} #{@credit.product.payout.periocidad}. La tasa de interes del préstamo es del #{'%.2f' % @credit.product.taza_de_interes_ordinaria} % #{@credit.product.plazo}.",:size =>10,:align => :justify 
    text" Los recibos surtidos a 'El Acreedor' no deberán rebasar la línea de crédito establecida que es de $ #{Dinero.to_money(@credit.monto_solicitud)}.",:size =>10,:align => :justify 
    text" 'El Acreedor' tiene en todo momento el derecho de negar cualquier pedido a 'El Deudor' cuando algún recibo se encuentre con más de 1 días, independientemente de su adeudo será menor de $ #{Dinero.to_money(@credit.monto_solicitud)} " ,:size =>10,:align => :justify 
    text" 'El Acreedor' tiene en todo momento el derecho de negar cualquier pedido a 'El Deudor' cuando su saldo sea mayor de $ #{Dinero.to_money(@credit.monto_solicitud)}, independientemente de su vencimiento.",:size =>10,:align => :justify 
    text" La línea de crédito otorgada jamás podrá exceder a la cantidad que resulte de 2 meses de sueldo que el cliente demuestre para la apertura del presente contrato de apertura de crédito.",:size =>10,:align => :justify 
    text" CUARTA: A falta de pago puntual de cualquier recibo emitido por 'El Acreedor' de conformidad con las segunda y tercera, se dará por vencido este contrato, y en consecuencia se suspenderá la linea de crédito, debiendo 'El Acreedor' exigir a 'El Deudor'",:size =>10,:align => :justify 
    text" A. Interes moratorios de #{'%.2f' %  @credit.product.taza_de_interes_moratoria}% por el importe de saldo insoluto vencido (mensual).",:size =>10,:align => :justify 
    text" B. Pago inmediato de la cantidad que como saldo total este adeudándole.",:size =>10,:align => :justify 
    text" C. La resición de este contrato y por consiguiente, el pago de las prestaciones legales a que haya lugar.",:size =>10,:align => :justify 
    text" QUINTA: 'El Deudor' o las personas autorizadas por él, al firmar el recibo o el documento hacen constar que recibió el o los artículos descritos en su entera satisfacción.",:size =>10,:align => :justify 
    text" SEXTA: Para la interpretación del presente contrato, las partes se someten a lo que determinen los tribunales competentes de la ciudad de #{@credit.ciudad_tribunal}, renunciando expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuro o de cualquier índole.",:size =>10,:align => :justify 
    text" Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de #{@credit.padre.municipio}, #{@credit.padre.estado}  el día de #{@credit.fecha_en_español}.",:size =>10,:align => :justify 
    text"  __________________________                                                                          ________________________",:size =>10,:align => :justify 
    text"         'EL ACREEDOR'                                                                                                             'EL DEUDOR'",:size =>10,:align => :justify 
    text"
    "
   text" * CAT (Costo Anual Total) #{@credit.cat_sin_iva}% sin IVA.
    * Comisión Nacional para la Protección y Defensa de los Usuarios de Servicios Financieros (CONDUSEF)
     Tel. (55)5340 0999 y 01 800 999 8080 www.condusef.gob.mx
    * Registro de Contratos de Adhesión (RECA) Número: #{@credit.product.registro_del_contrado_de_adhesion}
    
    ",:size =>8,:align => :justify  
start_new_page
    
text "PAGARÉ                                                                                                     No._______ BUENO POR $ ________________",:size =>10
text" 
"
text "En ___________________________ a ____ de _____________ de 20___ ",:size =>10,:align => :right
text" 
"
text "Debo(emos) y pagaré(mos) incondicionalmente por este pagaré a la orden de __________________________________",:size =>10,:align => :justify 
text" 
"
text "______________________________________________________ el ________________________________________",:size =>10,:align => :justify 
text" 
"
text "Valor recibido a mi(nuestra) entera satisfacción. Este pagaré está sujeto a las condiciones de que al no pagarse a su vencimiento, será exigible desde la fecha de su vencimiento de este documento hasta el dia de su total liquidación, causando intereses moratorios al tipo de _____% mensual pagadero en esta ciudad juntamente con el principal.

",:size =>10,:align => :justify 
text "Nombre y datos de 'EL DEUDOR'                          Nombre y datos de 'EL AVAL'",:size =>10,:align => :center 
text" "
text "Nombre: _______________________________________     Nombre: _______________________________________",:size =>10,:align => :justify 
text"   "
text "Domicilio:__________________________Tel._________       Domicilio:__________________________Tel._________",:size =>10,:align => :justify 
text "Acepto(amos)                                                                           Acepto(amos)",:size =>10,:align => :left 
text" 
"
text "Firma(s)________________________________________      Firma(s)________________________________________",:size =>10,:align => :justify 
  end
end
