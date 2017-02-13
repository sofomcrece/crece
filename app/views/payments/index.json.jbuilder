json.array!(@credits) do |credit|
  json.extract! credit, :id,:nombre_completo_deudor,:monto_solicitud
end
