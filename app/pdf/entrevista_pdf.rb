class EntrevistaPdf < Prawn::Document
  def initialize(credit)
    super()
    @credit = credit 
    text_content
  end
  def text_content
    image "#{Rails.root}/app/assets/images/logo marjo.png", width: 190, height: 45
      text "________________________________________________________________________________"
      text "
      ENTREVISTA DEL CLIENTE 
      ",:size => 10, :align => :center, :style  => :bold
      text "Sucursal :#{@credit.padre.branch_office.nombre} Empresa : #{@credit.padre.nombre_completo}
      ",:size => 10
      text "R.F.C. : #{@credit.RFC} CURP : #{@credit.CURP} INE/IFE : #{@credit.INE}
      ",:size => 10
      text "NOMBRE COMPLETO : #{@credit.nombre_completo_deudor}
      ",:size => 10
      text "DOMICILIO: #{@credit.calle}
      ",:size => 10
      text "PAIS DOMICILIO : #{@credit.country}  ESTADO DOMICILIO : #{@credit.estado_actual}
      ",:size => 10
      text "MUNICIPIO DOMICILIO :  #{@credit.municipio}
      ",:size => 10
      text "COLONIA: #{@credit.colonia}    NUM. EXTERIOR: #{@credit.numero_exterior} NUM. INTERIOR: #{@credit.numero_interior}
      ",:size => 10
      text "CODIGO POSTAL : #{@credit.codigo_postal} ANTIGUEDAD DEL DOMICILIO :#{@credit.antiguedad_en_el_domicilio_actual_anos} AÑOS CON  #{@credit.antiguedad_en_el_domicilio_actual_meses } MESES  
      ",:size => 10
      text "TEL PARTICULAR : #{@credit.telefono_de_casa}  TEL OFICINA :  #{@credit.telefono_empresa}
      ",:size => 10
      text "CELULAR : #{@credit.telefono_celular} E-MAIL : #{@credit.email_1}
      ",:size => 10
      text "SEXO : #{@credit.sexo==1?"Hombre":"Mujer"}    NO. DE DEPENDIENTES : #{@credit.numero_de_dependientes_economicos}
      ",:size => 10
      text "GASTO PROMEDIO :  #{(@credit.gasto_promedio_mensual)}  ESTADO CIVIL : #{@credit.estado_civil_cadena}
      ",:size => 10
      text "NOMBRE COMPLETO CÓNYUGE : #{@credit.apellido_paterno_del_conyuge}  #{@credit.apellido_materno_del_conyuge}  #{@credit.nombre_1_del_conyuge} #{@credit.nombre_2_del_conyuge}
      ",:size => 10
      text "CEL CÓNYUGE : #{@credit.telefono_celular_del_conyuge}   TEL OFICINA CÓNYUGE: #{@credit.telefono_de_oficina_del_conyuge}
      ",:size => 10
      text "NOMBRE DEPENDIENTE 1 : #{@credit.nombre_completo_1}
      ",:size => 10
      text "EDAD DEPENDIENTE 1 :  #{@credit.edad_1} AÑOS
      ",:size => 10
      text "PARENTESCO DEPENDIENTE 1: #{@credit.parentesco_del_dependiente_1}
      ",:size => 10
      text "NOMBRE DEPENDIENTE 2:  #{@credit.nombre_completo_2}
      ",:size => 10
      text "EDAD DEPENDIENTE 2: #{@credit.edad_2} AÑOS
      ",:size => 10
      text "PARENTESCO DEPENDIENTE 2: #{@credit.parentesco_del_dependiente_2}
      ",:size => 10
      text "NOMBRE DEPENDIENTE 3:  #{@credit.nombre_completo_3}
      ",:size => 10
      text "EDAD DEPENDIENTE 3: #{@credit.edad_3}
      ",:size => 10
      text "PARENTESCO DEPENDIENTE 3: #{@credit.parentesco_del_dependiente_3}
      ",:size => 10
      text "NOMBRE DEPENDIENTE 4:  #{@credit.nombre_completo_4}
      ",:size => 10
      text "EDAD DEPENDIENTE 4: #{@credit.edad_4}
      ",:size => 10
      text "PARENTESCO DEPENDIENTE 4: #{@credit.parentesco_del_dependiente_4}
      ",:size => 10
      text "NOMBRE DEPENDIENTE 5 : 
      ",:size => 10
      text "EDAD DEPENDIENTE 5 : 
      ",:size => 10
      text "PARENTESCO DEPENDIENTE 5: 
      ",:size => 10
      text "PAIS DE NAC : #{@credit.country}     ESTADO DE NAC :  #{@credit.estado_de_nacimiento}
      ",:size => 10
      text "MUNICIPIO DE NAC : #{@credit.ciudad_de_nacimiento}     NACIONALIDAD : #{@credit.nacionalidad}
      ",:size => 10
      text "FEC NACIMIENTO : #{@credit.fecha_de_nacimiento.strftime("%d/%m/%Y")}    FEC INGRESO TRABAJO : #{@credit.fecha - @credit.antiguedad_laboral_anos.year - @credit.antiguedad_laboral_meses.month}
      ",:size => 10
      text "NOMBRE DE LA EMPRESA : #{@credit.empresa_donde_labora}
      ",:size => 10
      text "TEL EMPRESA : #{@credit.telefono_empresa}    DOMICILIO EMP : #{@credit.dirreccion_empresa}
      ",:size => 10
      text "COLONIA EMP : #{@credit.colonia_empresa}
      ",:size => 10
      text "MUNICIPIO EMP : #{@credit.municipio_empresa}
      ",:size => 10
      text "ANTIGUEDAD DE LA EMPRESA : #{@credit.antiguedad_laboral_anos} AÑOS CON #{@credit.antiguedad_laboral_meses} MESES
      ",:size => 10
      text "ACTIVIDAD ECONOMICA : #{@credit.economical_activity.descripcion} 
      ",:size => 10 
      text "PROFESION : #{@credit.profecion.descripcion} 
      ",:size => 10
      text "OCUPACION: #{@credit.ocupation.descripcion}
      ",:size => 10
      text "SUELDO MENSUAL: #{(@credit.sueldo_mensual_neto)}   NSS: #{@credit.seguro} 
      ",:size => 10
      text "PARA QUE NECESITA EL CREDITO : #{@credit.destination.descricion}
      ",:size => 10
      text "NOMBRE REFERENCIA 1 : #{@credit.nombre_referencia_1}
      ",:size => 10
      text "DOMICILIO REFERENCIA 1 : #{@credit.domicilio_referencia_1}
      ",:size => 10
      text "TELEFONO REFERENCIA 1: FIJO: #{@credit.telefono_fijo_referencia_1} CEL: #{@credit.telefono_celular_referencia_1}
      ",:size => 10
      text "NOMBRE REFERENCIA 2 :  #{@credit.nombre_referencia_2}
      ",:size => 10
      text "DOMICILIO REFERENCIA 2 :  #{@credit.domicilio_referencia_2}
      ",:size => 10
      text "TELEFONO REFERENCIA 2: FIJO: #{@credit.telefono_fijo_referencia_2} CEL: #{@credit.telefono_celular_referencia_2}
      ",:size => 10
      text "NOMBRE FAMILIAR: #{@credit.nombre_referencia_familiar}
      ",:size => 10
      text "DOMICILIO FAMILIAR : #{@credit.domicilio_referencia_familiar}
      ",:size => 10
      text "TELEFONO FAMILIAR: #{@credit.telefono_fijo_referencia_familiar} CEL: #{@credit.telefono_celular_referencia_familiar}
      ",:size => 10
      text "OBSERVACIONES: #{@credit.observaciones}
      ",:size => 10
      text "* DECLARO BAJO PROTESTA DE DECIR VERDAD QUE LA INFORMACIÓN AQUÍ CONTENIDA ES PRODUCTO 
      ",:size => 10
      text "DE LA ENTREVISTA QUE ME FUE REALIZADA 
      ",:size => 10
  end
end
