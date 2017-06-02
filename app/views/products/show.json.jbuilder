json.extract! @product, :id, :nombre_del_producto, :registro_del_contrado_de_adhesion, :plazo_de_prestamo, :numero_de_pagos_a_realizar, :taza_de_interes_ordinaria, :taza_de_interes_moratoria, :cat_sin_iva, :numero_de_meses_de_sueldo_para_prestamo, :created_at, :updated_at
fa = Payment.select(:fecha_de_impresion).joins(:credit=>:product).where("credits.status = ? ",1 ).where("products.id = ? ", @product.id).uniq
fp = Payment.select(:fecha_de_pago).joins(:credit=>:product).where("credits.status = ? ",1 ).where("products.id = ? ", @product.id).uniq
json.fechas_activas fa
json.fechas_de_pago fp
json.fechas_activas_con_formato  json.array(fa) do |f|
    json.fecha_de_impresion f.fecha_de_impresion.strftime("%d/%m/%Y")
end
json.fechas_de_pago_con_formato json.array(fp) do |f|
    json.fecha_de_pago f.fecha_de_pago.strftime("%d/%m/%Y")
end