json.array!(@credits) do |credit|
  json.extract! credit, :id,:agente_empresa,:referencia_agente_empresa,:fecha,:es_cliente,:como_se_entero,:familiar_con_prestamo,:nombre_completo_familiar_1,:parentesco_1,:apellido_paterno,:apellido_materno,:nombre_1,:nombre_2,:RFC,:CURP,:numero_de_cheque,:fecha_de_contrato
  json.monto_solicitud_formato Dinero.to_money credit.monto_solicitud
  json.nombre_completo_deudor credit.nombre_completo_deudor
  json.url credit_url(credit, format: :json)
  json.nombre_padre (credit.padre.nil?)? "Desconocido":credit.padre.nombre_completo
  json.fecha_formato credit.fecha.strftime("%d/%m/%Y")
  json.cancelar credit_path(credit,:credit=>{status:2})
  json.imprimir "/view_credits/documentos?clave=#{credit.id}"
  json.tipo current_user.tipo
  json.sucursal credit.padre.branch_office.nombre
  json.fecha_de_contrato_formato credit.fecha_de_contrato.strftime("%d/%m/%Y") unless credit.fecha_de_contrato.nil?
  json.nombre_agente credit.padre.nombre_completo
end
