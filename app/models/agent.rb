class Agent < ActiveRecord::Base
    belongs_to :branchOffice
    validates :clave,
    :nombre_del_agente,
    :apellido_materno,
    :apellido_paterno,
    :nombre_1,
    :RFC,
    :calle,
    :numero_interior,
    :numero_exterior,
    :colonia,
    :codigo_postal,
    :municipio,
    :estado,
    :CURP,
    :seguro_social,
    :INE,
    :nacionalidad,
    :fecha_de_nacimiento,
    :ciudad_de_nacimiento,
    :estado_de_nacimiento,
    :pais_de_nacimiento,
    :sexo,
    :telefono_de_casa,
    :telefono_celular,
    :correo_electronico_1,
    :cuenta_bancaria,
    :banco,
    :comision_por_cobranza,
    :comision_por_colocacion,
    :monto_maximo_de_prestamo,
    :permitir_prestamo_multiple,
    :branch_office_id,
    presence:true
     validates_format_of :RFC, :with => /([A-Z][A-Z]|[A-Z])[A-Z][A-Z]\d\d\d\d\d\d\w\w\w/
     
  def RFC=(val)
    write_attribute :RFC, val.upcase
  end
end
