class Company < ActiveRecord::Base
  belongs_to :branch_office
  validates :clave,
    :nombre_de_empresa,
    :razon_social,
    :calle,
    :numero_exterior,
    :numero_interior,
    :colonia,
    :codigo_postal,
    :municipio,
    :estado,
    :apellido_paterno,
    :apellido_materno,
    :nombre_1,
    :telefono_de_oficina,
    :telefono_celular,
    :correo_electronico_1,
    :comicion_por_cobranza,
    :comicion_por_colocacion,
    :monto_maximo_de_prestamo,
    :branch_office_id,
  presence: true
  validates :permitir_prestamo_multiple ,
    :inclusion => { :in => [true, false] }
  validates :permitir_prestamo_multiple ,
    :presence => { :if => 'permitir_prestamo_multiple.nil?' }
  def nombre_completo
    nombre_de_empresa
  end
  def domicilio
    cad = "calle #{calle}, no_ext:#{numero_exterior}, "
    cad = cad + "no_int: #{numero_interior} " unless numero_interior.nil?
    cad =cad +" colonia: #{colonia}, cp: #{codigo_postal}"
  end
end
