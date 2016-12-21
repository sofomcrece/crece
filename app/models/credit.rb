class Credit < ActiveRecord::Base
    belongs_to :economical_activity
    belongs_to :customer
    belongs_to :product
    has_attached_file :croquis
    validates_attachment_content_type :croquis, content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']
    validates :referencia_agenteEmpresa,
    :fecha,
    :apellido_paterno,
    :apellido_materno,
    :nombre_1,
    :nombre_2,
    :RFC,
    :CURP,
    :seguro,
    :INE,
    :nacionalidad,
    :fecha_de_nacimiento,
    :ciudad_de_nacimiento,
    :estado_de_nacimiento,
    :telefono_de_casa,
    :telefono_celular,
    :email_1,
    :escolaridad,
    :numero_de_dependientes_economicos,
    :gasto_promedio_mensual,
    :estado_civil,
    :calle,
    :numero_exterior,
    :tipo_de_domicilio,
    :codigo_postal,
    :colonia,
    :municipio,
    :empresa_donde_labora,
    :giro_de_la_empresa,
    :puesto,
    :telefono_empresa,
    :sueldo_mensual_neto,
    :dirreccion_empresa,
    :colonia_empresa,
    :municipio_empresa,
    :monto_solicitud,
    :cada_cuanto_se_realizara_el_pago,
    :lugar_donde_se_realizara_el_pago,
    :nombre_referencia_1,
    :domicilio_referencia_1,
    :antiguedad_laboral_anos,
    :antiguedad_laboral_meses,
    :nombre_referencia_2,
    :domicilio_referencia_2,
   
    :country,
    :nombre_referencia_familiar,
    :domicilio_referencia_familiar,
    :economical_activity_id,
    :estado_actual,
    :localidad,
    :product_id,
    presence: true
    before_save :default_values
    def default_values
      self.status ||= 0
    end
    validates :status, :inclusion => {:in => [nil,0,1,2,3]}
    # 0 por aceptar
    # 1 aceptado
    # 2 rechazada
    # 3 finalizada
    validates :sexo,
    :inclusion => { :in => [nil,1, 0] }
    validates :sexo,
    :presence => { :if => 'sexo.nil?' }
    
    validates :es_cliente,
    :inclusion => { :in => [nil,1, 0] }
    validates :es_cliente,
    :presence => { :if => 'es_cliente.nil?' }
    
    validates :familiar_con_prestamo,
    :inclusion => { :in => [nil,1, 0] }
    validates :familiar_con_prestamo,
    :presence => { :if => 'familiar_con_prestamo.nil?' }
    validates_format_of :RFC, :with => /([A-Z][A-Z]|[A-Z])[A-Z][A-Z]\d\d\d\d\d\d\w\w\w/
    #eee555555eee
     validates_format_of :CURP, :with => /[A-Z][A-Z][A-Z][A-Z]\d\d\d\d\d\d\w\w\w\w\w\w\d\d/
     #BEML920313HCMLNS09.
     validates :agente_empresa,
    :inclusion => { :in => [nil,1, 0] }
    validates :agente_empresa,
    :presence => { :if => 'agente_empresa.nil?' }
    def fecha_en_español
        cad ="#{Time.now.day} de "
        case Time.now.month  
        when 1
            cad = cad + "Enero"
        when 2
            cad = cad + "Febrero"
        when 3
            cad = cad + "Marzo"
        when 4
            cad = cad + "Abril"
        when 5
            cad = cad + "Mayo"
        when 6
            cad = cad + "Junio"
        when 7
            cad = cad + "Julio"
        when 8
            cad = cad + "agosto"
        when 9
            cad = cad + "Septiembre"
        when 10
            cad = cad + "Octubre"
        when 11
            cad = cad + "Noviembre"
        when 12
            cad = cad + "Diciembre"
        else
            cad = cad + "mes invalido"
        end
        cad = cad + " del #{Time.now.year}"
    end
    
    def padre 
        if agente_empresa==1
          return  Agent.find(self.referencia_agenteEmpresa)
        else
          return  Company.find(self.referencia_agenteEmpresa)
        end
    end
    def tipo_padre
        if agente_empresa==1
            "Agente"
        else
            "Empresa"
        end
    end 
    def nombre_completo_deudor
        "#{apellido_paterno} #{apellido_materno} #{nombre_1} #{nombre_2}"
    end
    def domicilio
    cad = "calle #{calle}, no_ext:#{numero_exterior}, "
    cad = cad + "no_int: #{numero_interior} " unless numero_interior.nil?
    cad =cad +" colonia: #{colonia}, cp: #{codigo_postal}"
  end
  def getCorrida 
        total= self.monto_solicitud.to_f + self.monto_solicitud.to_f * (self.product.taza_de_interes_ordinaria/100)
        pago = total/self.product.numero_de_pagos_a_realizar
        capital = pago/(1 + (self.product.taza_de_interes_ordinaria / 100))
        interes = (capital * ( self.product.taza_de_interes_ordinaria / 100))/ (1+ ((self.product.taza_de_interes_ordinaria - self.product.cat_sin_iva)/ 100))
        iva = interes*(self.product.taza_de_interes_ordinaria - self.product.cat_sin_iva)/100
        fecha = self.fecha
        arreglo = []
        arreglo.push(["PERIODO", "FECHA DE PAGO", "SALDO INICIAL", "CAPITAL", "INTERES", "IVA DE INTERES", "PAGO TOTAL", "SALDO FINAL"])
        self.product.numero_de_pagos_a_realizar.times do |n|
            arreglo.push([ "#{n+1}","#{(n%2==1)? fecha=fecha+15.day : fecha=fecha.end_of_month}","$#{(total-((n)*pago)).round(2)}","$#{capital.round(2)}","$#{interes.round(2)}","$#{iva.round(2)}","$#{pago.round(2)}","$#{((total-((n)*pago))-pago).round(2)}"])
        end
    arreglo
    end
end
