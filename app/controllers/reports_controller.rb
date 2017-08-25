class ReportsController < ApplicationController
  def seguimiento
    require 'json'
    unless params[:fecha].nil? or params[:tipo].nil? or params[:id].nil? or params[:producto].nil?
     fecha = params[:fecha].to_date
     padre = params[:tipo].to_i==1? Agent.find(params[:id].to_i) : Company.find(params[:id].to_i)
     producto = params[:producto].to_i
     @resp = Hash.new("respuesta")
     @resp["nombre_empresa"] = padre.clave
     @resp["fecha"] = fecha
     @resp["datos"] = get_seguimiento_de_cobranza(padre,fecha,producto)
    end
  end
  def seguimiento_quincenal
     require 'json'
     unless params[:fecha].nil? or params[:tipo].nil? or params[:id].nil?
     fecha = params[:fecha].to_date
     padre = params[:tipo].to_i==1? Agent.find(params[:id].to_i) : Company.find(params[:id].to_i)
     @resp = Hash.new("respuesta")
     @resp["nombre_empresa"] = padre.clave
     @resp["fecha"] = fecha
     @resp["datos"] = get_seguimiento_de_cobranza(padre,fecha)
    end
  end
  def cobranza
    @tickets =  Ticket.where(status:0)  
  end
  def tablero 
     require 'json'
     unless params[:fecha].nil? or params[:tipo].nil? or params[:id].nil? or params[:producto].nil?
     fecha = params[:fecha].to_date
     padre = params[:tipo].to_i==1? Agent.find(params[:id].to_i) : Company.find(params[:id].to_i)
     producto = params[:producto].to_i
     @resp =Hash.new
     @resp["fecha"]=fecha
     @resp["padre"]=padre
     @resp["producto"]=producto
     get_tablero(padre,fecha,producto)
    end
  end
  def pronostico_de_cobranza
      @fecha= params[:fecha].to_date unless params[:fecha].nil?  or params[:fecha] == ""
      @sucursales = BranchOffice.all
      @sucursales = @sucursales.where(id:params[:sucursal]) unless params[:sucursal].nil? or params[:sucursal] ==""
  end
  def clientes
      @sucursales = BranchOffice.all
      @sucursales = @sucursales.where(id:params[:sucursal]) unless params[:sucursal].nil? or params[:sucursal] ==""
  end
  
  
  def get_tablero(padre,fecha,producto)
    info = Hash.new("datos")
    tabla = get_seguimiento_de_cobranza(padre,fecha,producto)
    
    ac=0
    info["a_cobrar_1"]=0
    info["cobrado_1"]=0
    tabla.each do |fila|
        info["a_cobrar_1"] = info["a_cobrar_1"].to_d + fila["pagar"].to_d + fila["atrasado"].to_d
        info["cobrado_1"] = info["cobrado_1"].to_d + fila["cobrado"].to_d
    end
  end
  def get_seguimiento_de_cobranza(padre,fecha,producto)
    tabla = []
    credits = padre.credits.where(product:producto.to_i).where(status:1)
   credits.each do |credit|
    payment  = Payment.all.where("credit_id = ? and fecha_de_pago = ?", credit.id, fecha)[0]
    activar = false
    if(payment.nil?)
        activar = false
    elsif payment.estatus==2
        activar= true
    else
        activar= false
    end
    fila = Hash.new()
    fila["nombre_completo"] = "#{credit.nombre_1} #{credit.nombre_2} #{credit.apellido_paterno} #{credit.apellido_materno}"
    fila["fecha"] = credit.fecha
    fila["monto_solicitud"] = credit.monto_solicitud
    fila["monto_a_pagar"] = credit.payments.sum(:importe)
    fila["pagado"] = Ticket.joins(:payment=>:credit).where("credits.id = ? and tickets.status = ?",credit.id,0).sum(:cantidad)
    fila["adeudo"] = fila["monto_a_pagar"].to_s.to_d - fila["pagado"].to_s.to_d
    fila["pagar"] = Payment.all.where("credit_id = ? and fecha_de_pago = ?", credit.id, fecha).sum(:importe).to_s.to_d
    pagos = Payment.all.where("credit_id = ? and fecha_de_pago < ?", credit.id, fecha)
    fila["atrasado"] = pagos.sum(:importe).to_s.to_d <= fila["pagado"].to_s.to_d ? 0 : pagos.sum(:importe).to_s.to_d - fila["pagado"].to_s.to_d
    fila["interes_moratorio"] = pagos.sum(:interes).to_s.to_d
    fila["total_a_cobrar"] = (activar)? "0" : fila["interes_moratorio"] + fila["atrasado"] + fila["pagar"]
    fila["cobrado"] =(activar)? "0" : Payment.joins(:tickets).where("credit_id = ? and fecha_de_pago = ? and tickets.status = 0 and tickets.created_at >= ? ", credit.id, fecha,fecha).sum(:cantidad)
    fila["diferencia"] = fila["total_a_cobrar"].to_s.to_d - fila["cobrado"].to_s.to_d
    fila["adelantado"] = Ticket.joins(:payment=>:credit).where("credits.id = ? and payments.fecha_de_pago > ? and tickets.status = ?",credit.id, fecha,0).sum(:cantidad)
    fila["empresa"] = credit.padre.nombre_completo
    fila["numero_de_pago"] = Payment.all.where("credit_id = ? and fecha_de_pago = ?", credit.id, fecha)[0].recibo unless Payment.all.where("credit_id = ? and fecha_de_pago = ?", credit.id, fecha)[0].nil?
    fila["numero_de_creditos"] = credit.customer.credits.count
    tabla << fila
   end
   return tabla
  end
end
