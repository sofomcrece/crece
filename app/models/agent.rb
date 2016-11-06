class Agent < ActiveRecord::Base
    belongs_to :branch_office
    validates :clave,
    :nombre_del_agente,
    :apellido_materno,
    :apellido_paterno,
    :nombre_1,
    :RFC,
    :calle,
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
    :telefono_celular,
    :correo_electronico_1,
    :comision_por_cobranza,
    :comision_por_colocacion,
    :monto_maximo_de_prestamo,
    :branch_office_id,
    presence:true
     validates_format_of :RFC, :with => /([A-Z][A-Z]|[A-Z])[A-Z][A-Z]\d\d\d\d\d\d\w\w\w/
     
     
  def RFC=(val)
    write_attribute :RFC, val.upcase
  end
    validates_format_of :CURP, :with => /[A-Z][A-Z][A-Z][A-Z]\d\d\d\d\d\d\w\w\w\w\w\w\d\d/
     #BEML920313HCMLNS09.
  def CURP=(val)
    write_attribute :CURP, val.upcase
  end
  validates :sexo,
    :inclusion => { :in => [true, false] }
  validates :sexo,
    :presence => { :if => 'sexo.nil?' }
end
