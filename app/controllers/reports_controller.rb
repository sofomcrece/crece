class ReportsController < ApplicationController
  def seguimiento
    require 'json'
    unless params[:fecha].nil? or params[:tipo].nil? or params[:id].nil? or params[:producto].nil?
     fecha = params[:fecha].to_date
     padre = params[:tipo].to_i==1? Agent.find(params[:id].to_i) : Company.find(params[:id].to_i)
     producto = params[:producto].to_i
     @resp = Hash.new("respuesta")
     @resp["nombre_empresa"] = padre.nombre_completo
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
     @resp["nombre_empresa"] = padre.nombre_completo
     @resp["fecha"] = fecha
     @resp["datos"] = get_seguimiento_de_cobranza(padre,fecha)
    end
  end
  def cobranza
    tipo_padre = params[:tipo]
    padre_id = params[:id]
    product_id = params[:producto]
    branch_office_id = params[:sucursal_id]
    fecha1 = params[:fecha1]
    fecha2 = params[:fecha2]
    @tickets =  Ticket.joins(:payment => :credit).where(status:0)  
    @tickets = @tickets.where("credits.agente_empresa = ? and credits.referencia_agente_empresa = ? ",tipo_padre,padre_id) unless  params[:tipo].nil? or  params[:tipo]=="" or  params[:id].nil? or  params[:id]==""
    @tickets = @tickets.where(:created_at => fecha1.to_date.beginning_of_day..fecha2.to_date.end_of_day) unless params[:fecha1].nil? or params[:fecha1]=="" or params[:fecha2].nil? or params[:fecha2]==""
    @tickets = @tickets.where("credits.product_id = ? ",product_id) unless params[:producto].nil? or params[:producto]==""
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
    payment  = Payment.all.where("credit_id = ? and fecha_de_corte = ?", credit.id, fecha)[0]
    
    fila = Hash.new()
    fila["nombre_completo"] = "#{credit.apellido_paterno} #{credit.apellido_materno} #{credit.nombre_1} #{credit.nombre_2}"
    fila["fecha"] = credit.fecha
    fila["monto_solicitud"] = credit.monto_solicitud
    fila["monto_a_pagar"] = credit.payments.sum(:importe)
    fila["pagado"] = Ticket.joins(:payment=>:credit).where("credits.id = ? and tickets.status = ?",credit.id,0).sum(:cantidad)
    fila["adeudo"] = fila["monto_a_pagar"].to_s.to_d - fila["pagado"].to_s.to_d
    fila["pagar"] = Payment.all.where("credit_id = ? and fecha_de_corte = ?", credit.id, fecha).sum(:importe).to_s.to_d - Payment.joins(:tickets).where("credit_id = ? and fecha_de_corte = ? and tickets.status = 0 and tickets.created_at < ?", credit.id, fecha,fecha).sum(:cantidad)
    pagos = Payment.all.where("credit_id = ? and fecha_de_corte < ?", credit.id, fecha)
    fila["atrasado"] = pagos.sum(:importe).to_s.to_d <= fila["pagado"].to_s.to_d ? 0 : pagos.sum(:importe).to_s.to_d - fila["pagado"].to_s.to_d
    fila["interes_moratorio"] = Payment.where("credit_id = ? and fecha_de_corte <= ? and estatus != ? ", credit.id, fecha,2).sum(:interes).to_s.to_d
    fila["total_a_cobrar"] =  fila["interes_moratorio"] + fila["atrasado"] + fila["pagar"]
    fila["cobrado"] = Payment.joins(:tickets).where("credit_id = ? and fecha_de_corte = ? and tickets.status = 0 and tickets.created_at >= ? ", credit.id, fecha,fecha).sum(:cantidad)
    fila["diferencia"] = fila["total_a_cobrar"].to_s.to_d - fila["cobrado"].to_s.to_d
    fila["adelantado"] = Ticket.joins(:payment=>:credit).where("credits.id = ? and payments.fecha_de_corte > ? and tickets.status = ?",credit.id, fecha,0).sum(:cantidad)
    fila["empresa"] = credit.padre.nombre_completo
    fila["numero_de_pago"] = Payment.all.where("credit_id = ? and fecha_de_corte = ?", credit.id, fecha)[0].recibo unless Payment.all.where("credit_id = ? and fecha_de_corte = ?", credit.id, fecha)[0].nil?
    fila["numero_de_creditos"] = credit.customer.credits.where("credits.status = ? or credits.status = ? ",1,3).count
    tabla << fila
   end
   return tabla
  end
end
