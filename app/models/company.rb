class Company < ActiveRecord::Base
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
    :cuenta_bacaria,
    :banco,
    :comicion_por_cobranza,
    :comicion_por_colocacion,
    :monto_maximo_de_prestamo,
    :permitir_prestamo_multiple,
  presence: true
  
  
end
