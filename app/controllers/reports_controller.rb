class ReportsController < ApplicationController
  def calificaciones
    respond_to do |format|
        format.html {  }
        format.xlsx { 
            tipo_padre = params[:tipo]
            padre_id = params[:id]
            branch_office_id = params[:sucursal_id]
            @branch_office = BranchOffice.find(branch_office_id) unless params[:sucursal_id].nil? or params[:sucursal_id]==""
            unless  params[:tipo].nil? or  params[:tipo]=="" or  params[:id].nil? or  params[:id]==""
                if tipo_padre.to_i == 1
                    @padre = Agent.find(padre_id)
                else
                    @padre = Company.find(padre_id)
                end
            end
            @customers = Customer.all
            @customers = @customers.where("customers.agente_empresa = ? and customers.referencia_agente_empresa = ? ",tipo_padre,padre_id) unless  params[:tipo].nil? or  params[:tipo]=="" or  params[:id].nil? or  params[:id]==""
            @customers = Customer.get_by_branch_office(@customers,@branch_office) unless params[:sucursal_id].nil? or params[:sucursal_id]==""
            @customers = @customers.order(:updated_at)  unless @customers == []   
        }
    end
    
  end
  def estado_de_cuenta
    @customer = Customer.find(params[:c_id]) unless params[:c_id].nil? or params[:c_id]==""
   respond_to do |format|
        format.html {  }
        format.pdf {
            fechas = []
            
            params[:fecha2]
            fechas << params[:f1].to_date unless params[:f1].nil? or params[:f1]==""
            fechas << params[:f2].to_date unless params[:f2].nil? or params[:f2]==""
            pdf = EstadoDeCuentaPdf.new(@customer,fechas)
            send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
        }
    end
  end
  def reporte_de_pagos
  
  end
   def historial_de_pagos
     respond_to do |format|
        format.html {  }
        format.xlsx {
            @customer = Customer.find(params[:id])
            
        }
    end
  end
  def seguimiento_conf
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
  def seguimiento
    respond_to do |format|
        format.html {  }
        format.json { self.seguimiento_conf }
        format.xlsx{ 
            self.seguimiento_conf 
            @fecha_encabezado = params[:fecha_encabezado] unless params[:fecha_encabezado].nil? or params[:fecha_encabezado] == ""
        }
        
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
    respond_to do |format|
        format.html {  }
        format.xlsx{
            if current_user.tipo == 3
                branch_office_id = current_user.branchOffices[0].id
            end
            tipo_padre = params[:tipo]
            padre_id = params[:id]
            product_id = params[:producto]
            branch_office_id = params[:sucursal_id]
            fecha1 = params[:fecha1]
            fecha2 = params[:fecha2]
            @tickets =  Ticket.joins(:payment => :credit).select("tickets.*, credits.agente_empresa, credits.referencia_agente_empresa, credits.product_id,credits.id ").where(status:0)  
            
            @tickets = @tickets.where("credits.agente_empresa = ? and credits.referencia_agente_empresa = ? ",tipo_padre,padre_id) unless  params[:tipo].nil? or  params[:tipo]=="" or  params[:id].nil? or  params[:id]==""
            @tickets = @tickets.where(:created_at => fecha1.to_date.beginning_of_day..fecha2.to_date.end_of_day) unless params[:fecha1].nil? or params[:fecha1]=="" or params[:fecha2].nil? or params[:fecha2]==""
            @tickets = @tickets.where("credits.product_id = ? ",product_id) unless params[:producto].nil? or params[:producto]==""
            @tickets = @tickets.order(:updated_at)
        }
    end
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
      @customers = Customer.all
      @customers = Customer.get_by_branch_office(@customers,BranchOffice.find(params[:sucursal].to_i)) unless params[:sucursal].nil? or params[:sucursal] ==""
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
    credits = padre.credits.select(Credit.column_names-["pdf64"]).where(product:producto.to_i).where(status:1).order(:apellido_paterno)
    credits.each do |credit|
    payment  = Payment.all.where("credit_id = ? and fecha_de_corte = ?", credit.id, fecha)[0]
    
    fila = Hash.new()
    fila["nombre_completo"] = "#{credit.nombre_completo_deudor}"
    fila["fecha"] = credit.fecha_de_contrato
    fila["monto_solicitud"] = credit.monto_solicitud
    fila["monto_a_pagar"] = credit.payments.sum(:importe)
    fila["pagado"] = Ticket.joins(:payment=>:credit).where("credits.id = ? and tickets.status = ?",credit.id,0).sum(:cantidad)
    fila["adeudo"] = fila["monto_a_pagar"].to_s.to_d - fila["pagado"].to_s.to_d
    fila["pagar"] = Payment.all.where("credit_id = ? and fecha_de_corte = ?", credit.id, fecha).sum(:importe).to_s.to_d - Payment.joins(:tickets).where("credit_id = ? and fecha_de_corte = ? and tickets.status = 0 and tickets.created_at < ?", credit.id, fecha,fecha).sum(:cantidad)
    pagos = Payment.all.where("credit_id = ? and fecha_de_corte < ?", credit.id, fecha)
    fila["atrasado"] = pagos.sum(:importe).to_s.to_d <= fila["pagado"].to_s.to_d ? 0 : pagos.sum(:importe).to_s.to_d - fila["pagado"].to_s.to_d
    fila["interes_moratorio"] = fila["atrasado"]==0? 0: Payment.where("credit_id = ? and fecha_de_corte <= ? and interes_flag = false", credit.id, fecha).sum(:interes).to_s.to_d
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
