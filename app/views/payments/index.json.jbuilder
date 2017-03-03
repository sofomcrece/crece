json.array!(@payments) do |payment|
  json.extract! credit, :id,:nombre_completo_deudor,:monto_solicitud
  json.extract! payment, :id, :folio,:fecha_de_pago,:recibo,:estatus,:importe,:pago,:interes
  json.activo payment.activo
  json.cliente payment.credit.nombre_completo_deudor
  json.importe_con_pago payment.importe.to_f - payment.total_pagado.to_f 
  json.ultimo_recibo payment.tickets.last
  json.ultimo_recibo_url tickets_path(payment.tickets.last)
end
