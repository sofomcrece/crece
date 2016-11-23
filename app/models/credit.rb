class Credit < ActiveRecord::Base
    belongs_to :economical_activity
    belongs_to :customer
    
    has_attached_file :croquis
    validates_attachment_content_type :croquis, content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']
    validates :referencia_agenteEmpresa,
    :fecha,
    :como_se_entero,
    :nombre_completo_familiar_1,
    :parentesco_1,
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
    :apellido_paterno_del_conyuge,
    :apellido_materno_del_conyuge,
    :nombre_1_del_conyuge,
    :telefono_celular_del_conyuge,
    :telefono_de_oficina_del_conyuge,
    :calle,
    :numero_interior,
    :numero_exterior,
    :tipo_de_domicilio,
    :codigo_postal,
    :colonia,
    :municipio,
    :empresa_donde_labora,
    :giro_de_la_empresa,
    :puesto,
    :telefono_empresa,
    :antiguedad_laboral,
    :sueldo_mensual_neto,
    :dirreccion_empresa,
    :colonia_empresa,
    :municipio_empresa,
    :monto_solicitud,
    :cada_cuanto_se_realizara_el_pago,
    :lugar_donde_se_realizara_el_pago,
    :nombre_referencia_1,
    :domicilio_referencia_1,
   
    :nombre_referencia_2,
    :domicilio_referencia_2,
   
    
    :nombre_referencia_familiar,
    :domicilio_referencia_familiar,
    
    :nombre_completo_familiar_2,
    :parentesco_2,
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
end
