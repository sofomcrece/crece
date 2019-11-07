class Auxiliar < ActiveRecord::Base
    def self.casa_nombre(val)
        case val
        when 0    #compare to 1
          return "Propia" 
        when 1    #compare to 2
          return "Familiar"
        when 2    #compare to 2
          return "Rentada"
        when 3    #compare to 2
          return "Hipoteca"
        else
            return "desconocido"
        end
    end
    def self.escolaridad_nombre(val)
        case val
        when 0    #compare to 1
          return "Primaria" 
        when 1    #compare to 2
          return "Secundaria"
        when 2    #compare to 2
          return "Preparatoria"
        when 3    #compare to 2
          return "Tecnico"
        when 4    #compare to 2
          return "Licenciatura"
        when 5    #compare to 2
          return "Posgrado"
        when 6    #compare to 2
          return "Sin estudios"
        else
            return "desconocido"
        end
    end
    def self.estado_civil_nombre(val)
        case val
        when 0    #compare to 1
          return "Soltero" 
        when 1    #compare to 2
          return "Casado"
        when 2    #compare to 2
          return "Divorciado"
        when 3    #compare to 2
          return "Union libre"
        when 4
          return "Viudo"
        else
            return "desconocido"
        end
    end
     def self.mes(val)
        case val
        when 1
            cad = "Enero"
        when 2
            cad = "Febrero"
        when 3
            cad = "Marzo"
        when 4
            cad = "Abril"
        when 5
            cad = "Mayo"
        when 6
            cad = "Junio"
        when 7
            cad = "Julio"
        when 8
            cad = "agosto"
        when 9
            cad = "Septiembre"
        when 10
            cad = "Octubre"
        when 11
            cad = "Noviembre"
        when 12
            cad = "Diciembre"
        else
            cad = "mes invalido"
        end
        return cad
    end
    def self.fecha_natural(f)
      return nil if f.nil?
      cad = f.strftime("%d") + " de #{self.mes(f.strftime("%m").to_i)} del #{f.strftime("%Y")}"  
    end
    def self.fecha_formato(f)
      return nil if f.nil?
      return f.strftime("%d/%m/%Y")
    end
    def self.folio(val)
      return "2503616176B#{"0"*(5-val.to_s.length)+val.to_s}"
    end
    def self.seguimiento_quincenal(padre,fecha,producto)
      arr = self.seguimiento(padre,fecha,producto)
      arr.delete_if { |elem| elem["numero_de_pago"] == "" or elem["numero_de_pago"].nil? }
      return arr
      
    end
    
    def self.seguimiento(padre,fecha,producto)
      
      credits = padre.credits.select(Credit.column_names-["pdf64"]).where(product:producto.to_i).where("credits.status = ? or credits.status = ?",1,3).order(:apellido_paterno)
      if self.seguimiento_guardado_contador(credits,fecha) > 0
        self.seguimiento_por_creditos_guardados(credits,fecha)
      else
        credits = credits.where(status:1)
        self.seguimiento_por_creditos(credits,fecha)
      end
    end
    
    def self.tablero(padre,fecha,producto)
      credits = padre.credits.select(Credit.column_names-["pdf64"]).where(product:producto.to_i).where("credits.status = ? or credits.status = ?",1,3).order(:apellido_paterno)
      if self.seguimiento_guardado_contador(credits,fecha) > 0
        self.seguimiento_por_creditos_guardados(credits,fecha)
      else
        credits = credits.where(status:1)
        self.seguimiento_por_creditos(credits,fecha)
      end
    end

     #Reporte de clientes de identificaciòn
    def self. Reporte_identificacion()      
      customers = Customer.all.where("customers.status = ? ",1).order(:apellido_paterno)     
        self.Reporte_identificacion_clientes(customers)     
    end
    def self.Reporte_identificacion_clientes(customers)
      tabla = []
      customers.each do |customer|
        tabla << self.generador_de_Reporte_identificacion_clientes(customer)
      end
     return tabla
    end
    def self.generador_de_Reporte_identificacion_clientes(customer)        
        fila = Hash.new()
         fila["ID_CLIENTE"] = customers.id
         fila["CUENTA"] = customers.id
         fila["ORIGEN"] = "cl"
         fila["NOMBRE"] = customers.nombre_1
         fila["NOMBRE_ADICIONAL"] = customers.nombre_2
         fila["APE_PATERNO"] = customers.apellido_paterno
         fila["APE_MATERNO"] = customers.apellido_materno
         fila["TIPO_PERSONA"] = "1"
         fila["CTE_RFC"] = customers.RFC
         fila["CTE_CURP"] = customers.CURP
         fila["RAZON_SOCIAL"] ="" 
         fila["FECHA_NAC"] = customers.fecha_de_nacimiento
         fila["NACIONALIDAD"] =(customers.nacionalidad == "MEXICO".to_s)? 1:2
         fila["DOMICILIO"] =  customers.calle.to_s + "#" + customers.numero_exterior.to_s + " C.P." + customers.codigo_postal.to_s
         fila["COLONIA"] = customers.colonia
         fila["CIUDAD"] = customers.ciudad_de_nacimiento
         fila["PAIS"] = (customers.country == "MEXICO".to_s)? 153:153
         fila["ESTADO"] = (customers.estado_actual == "SINALOA".to_s)? 25:25
         fila["TELEFONO_PARTICULAR"] = customers.telefono_celular
         fila["ACTIVIDAD_ECONOMICA"] = customers.economical_activity_id
         fila["CALIFICACION"] = "1"         
         fila["FECHA_ALTA"] = customers.created_at
         fila["SUCURSAL"] = customers.referencia_agente_empresa
         mi_curp=customers.CURP  
         fila["GENERO"] = (mi_curp [10]=="M")? 1:2
         fila["CORREO_ELECTRONICO"] = customers.email_1
         fila["FIRMA_ELECTRONICA"] = ""
         fila["PROFESION"] = customers.profecion_id
         fila["OCUPACION"] = customers.ocupation_id
         fila["PAIS_NACIMIENTO"] = (customers.country == "MEXICO".to_s)? 153:153       
         estadoCliente_id= customers.estado_de_nacimiento.to_s
          id_Estado_de_cliente = case estadoCliente_id
             when "Sinaloa" then "25"      
             when "Aguascalientes" then "1"
             when "Baja California" then "2"
             when "Baja California Sur" then "3"
             when "Campeche" then "4"
             when "Coahuila de Zaragoza" then "5"
             when "Colima" then "6"
             when "Chiapas" then "7"
             when "Chihuahua" then "8"
             when "Distrito Federal" then "9"
             when "Durango" then "10"
             when "Guanajuato" then "11"
             when "Guerrero" then "12"
             when "Hidalgo" then "13"
             when "Jalisco" then "14"
             when "México" then "15"
             when "Michoacán de Ocampo" then "16"
             when "Morelos" then "17"
             when "Nayarit" then "18"
             when "Nuevo León" then "19"
             when "Oaxaca" then "20"
             when "Puebla" then "21"
             when "Querétaro Arteaga" then "22"
             when "Quintana Roo" then "23"
             when "San Luis Potosí" then "24"
             when "Sonora" then "26"
             when "Tabasco" then "27"
             when "Tamaulipas" then "28"
             when "Tlaxcala" then "29"
             when "Veracruz de Ignacio de la Llave" then "30"
             when "Yucatán" then "31"
             when "Zacatecas" then "32" 
             else "25"
          end
         fila["ESTADO_NAC"] = estadoCliente_id
         fila["LUGAR_NAC"] = customers.estado_de_nacimiento
         fila["NUM_DOCTO"] = customers.INE
         fila["CONOCIMIENTO_CTE"] = ""
         fila["REGISTRO_NAC_INMIGRACION"] = ""
         fila["CUENTA_ORIGINAL"] = ""
         fila["TIPO_DOCTO"] = "INE"
         fila["INDICADOR_EMPLEO"] = "Si"
         fila["cte_empresa_labora"] = customers.empresa_donde_labora
         fila["INDICADOR_GOBIERNO"] = "VACIA"
         fila["PUESTO"] = customers.puesto
         fila["FECHA_INICIO"] = customers.created_at
         t = Time.now
         solo_fecha= t.strftime("%d/%m/%Y")
         fila["FECHA_FIN"] = solo_fecha 
        return fila
    end

    def self.generador_de_tuplas(credit,fecha)
        payment  = Payment.all.where("credit_id = ? and fecha_de_corte = ?", credit.id, fecha)[0]
        fila = Hash.new()
        fila["nombre_completo"] = "#{credit.nombre_completo_deudor}"
        fila["fecha"] = credit.fecha_de_contrato
        fila["monto_solicitud"] = credit.monto_solicitud
        fila["monto_a_pagar"] = credit.payments.sum(:importe)
        fila["pagado"] = Ticket.joins(:payment=>:credit).where("credits.id = ? and tickets.status = ?",credit.id,0).sum(:cantidad)
        fila["adeudo"] = fila["monto_a_pagar"].to_s.to_d - fila["pagado"].to_s.to_d
        fila["pagar"] = Payment.all.where("credit_id = ? and fecha_de_corte = ?", credit.id, fecha).sum(:importe).to_s.to_d - Ticket.joins(:payment).where("payments.credit_id = ? and payments.fecha_de_corte = ? and tickets.status = 0 and tickets.updated_at < ?", credit.id, fecha,fecha).sum(:cantidad) #Payment.joins(:tickets).where("credit_id = ? and fecha_de_corte = ? and tickets.status = 0 and tickets.created_at < ?", credit.id, fecha,fecha).sum(:cantidad)
        pagos = Payment.all.where("credit_id = ? and fecha_de_corte < ?", credit.id, fecha)
        #pagos = Payment.all.where("credit_id = ? and fecha_de_corte < ? updated_at", credit.id, fecha,fecha)
        fila["atrasado"] = pagos.sum(:importe).to_s.to_d <= fila["pagado"].to_s.to_d ? 0 : pagos.sum(:importe).to_s.to_d - fila["pagado"].to_s.to_d
        fila["interes_moratorio"] = fila["atrasado"]==0? 0: Payment.where("credit_id = ? and fecha_de_corte <= ? and interes_flag = false", credit.id, fecha).sum(:interes).to_s.to_d
        fila["total_a_cobrar"] =  fila["interes_moratorio"] + fila["atrasado"] + fila["pagar"]
        fila["adelantado"] = Ticket.joins(:payment=>:credit).where("credits.id = ? and payments.fecha_de_corte > ? and tickets.status = ?",credit.id, fecha,0).sum(:cantidad)
        #fila["cobrado"] = Payment.joins(:tickets).where("credit_id = ? and fecha_de_corte = ? and tickets.status = 0 and tickets.created_at >= ? ", credit.id, fecha,fecha).sum(:cantidad)
        fila["cobrado"] = Ticket.where(updated_at:credit.product.rangoDeCorte(fecha)).joins(:payment=>:credit).where("tickets.status = ?",0).where("payments.credit_id = ?",credit.id).sum("tickets.cantidad") - fila["adelantado"]
        fila["diferencia"] = fila["total_a_cobrar"].to_s.to_d - fila["cobrado"].to_s.to_d
        
        fila["empresa"] = credit.padre.nombre_completo
        fila["numero_de_pago"] = Payment.all.where("credit_id = ? and fecha_de_corte = ?", credit.id, fecha)[0].recibo unless Payment.all.where("credit_id = ? and fecha_de_corte = ?", credit.id, fecha)[0].nil?
        fila["numero_de_creditos"] = credit.customer.credits.where("credits.status = ? or credits.status = ? ",1,3).count 
        fila["tipo"] = 1
        #fila["payment_ref"] = payment.id
        fila["credit_id"] = credit.id 
        fila["fecha_corte"] = fecha
        return fila
    end
    
     def self.generador_de_tuplas_tablero(credit,fecha)
        payment  = Payment.all.where("credit_id = ? and fecha_de_corte = ?", credit.id, fecha)[0]
        fila = Hash.new()
        fila["nombre_completo"] = "#{credit.nombre_completo_deudor}"
        fila["fecha"] = credit.fecha_de_contrato
        fila["monto_solicitud"] = credit.monto_solicitud
        fila["monto_a_pagar"] = credit.payments.sum(:importe)
        fila["pagado"] = Ticket.joins(:payment=>:credit).where("credits.id = ? and tickets.status = ?",credit.id,0).sum(:cantidad)
        fila["adeudo"] = fila["monto_a_pagar"].to_s.to_d - fila["pagado"].to_s.to_d
        fila["pagar"] = Payment.all.where("credit_id = ? and fecha_de_corte = ?", credit.id, fecha).sum(:importe).to_s.to_d - Ticket.joins(:payment).where("payments.credit_id = ? and payments.fecha_de_corte = ? and tickets.status = 0 and tickets.updated_at < ?", credit.id, fecha,fecha).sum(:cantidad) #Payment.joins(:tickets).where("credit_id = ? and fecha_de_corte = ? and tickets.status = 0 and tickets.created_at < ?", credit.id, fecha,fecha).sum(:cantidad)
        pagos = Payment.all.where("credit_id = ? and fecha_de_corte < ?", credit.id, fecha)
        #pagos = Payment.all.where("credit_id = ? and fecha_de_corte < ? updated_at", credit.id, fecha,fecha)
        fila["atrasado"] = pagos.sum(:importe).to_s.to_d <= fila["pagado"].to_s.to_d ? 0 : pagos.sum(:importe).to_s.to_d - fila["pagado"].to_s.to_d
        fila["interes_moratorio"] = fila["atrasado"]==0? 0: Payment.where("credit_id = ? and fecha_de_corte <= ? and interes_flag = false", credit.id, fecha).sum(:interes).to_s.to_d
        fila["total_a_cobrar"] =  fila["interes_moratorio"] + fila["atrasado"] + fila["pagar"]
        fila["adelantado"] = Ticket.joins(:payment=>:credit).where("credits.id = ? and payments.fecha_de_corte > ? and tickets.status = ?",credit.id, fecha,0).sum(:cantidad)
        #fila["cobrado"] = Payment.joins(:tickets).where("credit_id = ? and fecha_de_corte = ? and tickets.status = 0 and tickets.created_at >= ? ", credit.id, fecha,fecha).sum(:cantidad)
        fila["cobrado"] = Ticket.where(updated_at:credit.product.rangoDeCorte(fecha)).joins(:payment=>:credit).where("tickets.status = ?",0).where("payments.credit_id = ?",credit.id).sum("tickets.cantidad") - fila["adelantado"]
        fila["diferencia"] = fila["total_a_cobrar"].to_s.to_d - fila["cobrado"].to_s.to_d
        
        fila["empresa"] = credit.padre.nombre_completo
        fila["numero_de_pago"] = Payment.all.where("credit_id = ? and fecha_de_corte = ?", credit.id, fecha)[0].recibo unless Payment.all.where("credit_id = ? and fecha_de_corte = ?", credit.id, fecha)[0].nil?
        fila["numero_de_creditos"] = credit.customer.credits.where("credits.status = ? or credits.status = ? ",1,3).count 
        fila["tipo"] = 1
        #fila["payment_ref"] = payment.id
        fila["credit_id"] = credit.id 
        fila["fecha_corte"] = fecha
        
        fila["al_corriente"] =pagos.where("estatus=0").count
        fila["atrasados"] =pagos.where("estatus=1").count
        fila["Pagados"] =pagos.where("estatus=2").count
        #fila["periodos_venc"] = 0
        
        return fila
    end
    
    def self.seguimiento_por_creditos(credits,fecha)
      tabla = []
      credits.each do |credit|
        tabla << self.generador_de_tuplas(credit,fecha)
      end
     return tabla
    end
    
     def self.tablero_por_creditos(credits,fecha)
      tabla = []
      credits.each do |credit|
        tabla << self.generador_de_tuplas_tablero(credit,fecha)
      end
     return tabla
    end
    
    def self.seguimiento_guardado_contador(credits,fecha)
      count = 0
      credits.each do |credit|
        seguimiento = Seguimiento.all.where("credit_id = ? and fecha_corte = ?", credit.id, fecha.to_date)[0]
        count += 1 unless seguimiento.nil?
      end
      return count
    end
    
    def self.tablero_guardado_contador(credits,fecha)
      count = 0
      credits.each do |credit|
        tablero = Tablero.all.where("credit_id = ? and fecha_corte = ?", credit.id, fecha.to_date)[0]
        count += 1 unless tablero.nil?
      end
      return count
    end
    
    def self.seguimiento_por_creditos_guardados(credits,fecha)
      tabla = []
      credits.each do |credit|
        seguimiento  = Seguimiento.all.where("credit_id = ? and fecha_corte = ?", credit.id, fecha.to_date)[0]
        if seguimiento.nil?
          next if credit.status == 3
          tabla << self.generador_de_tuplas(credit,fecha)
          next
        end
        fila = Hash.new()
        fila["nombre_completo"] = "#{credit.nombre_completo_deudor}"
        fila["fecha"] = credit.fecha_de_contrato
        fila["monto_solicitud"] = credit.monto_solicitud
        fila["monto_a_pagar"] = credit.payments.sum(:importe)
        fila["pagado"] = Ticket.joins(:payment=>:credit).where("credits.id = ? and tickets.status = ?",credit.id,0).sum(:cantidad)
        fila["adeudo"] = fila["monto_a_pagar"].to_s.to_d - fila["pagado"].to_s.to_d
        fila["pagar"] = seguimiento.a_pagar
        pagos = Payment.all.where("credit_id = ? and fecha_de_corte < ?", credit.id, fecha)
        #pagos = Payment.all.where("credit_id = ? and fecha_de_corte < ? updated_at", credit.id, fecha,fecha)
        fila["atrasado"] = seguimiento.atrasado
        fila["interes_moratorio"] = seguimiento.interés_moratorio
        fila["total_a_cobrar"] =  seguimiento.total_a_cobrar
        quitar =  (credit.id == 982 and fecha == "13/10/2018".to_date)? 20: 0
        fila["adelantado"] = Ticket.joins(:payment=>:credit).where("credits.id = ? and payments.fecha_de_corte > ? and tickets.status = ? and tickets.updated_at > ?",credit.id, fecha, 0, fecha).sum(:cantidad) - quitar
        #fila["cobrado"] = Payment.joins(:tickets).where("credit_id = ? and fecha_de_corte = ? and tickets.status = 0 and tickets.created_at >= ? ", credit.id, fecha,fecha).sum(:cantidad)
        fila["cobrado"] = Ticket.where(updated_at:credit.product.rangoDeCorte(fecha)).joins(:payment=>:credit).where("tickets.status = ?",0).where("payments.credit_id = ?",credit.id).sum("tickets.cantidad") - fila["adelantado"]
        fila["diferencia"] = fila["total_a_cobrar"].to_s.to_d - fila["cobrado"].to_s.to_d
       
        fila["empresa"] = credit.padre.nombre_completo
        fila["numero_de_pago"] = seguimiento.no_pago
        fila["numero_de_creditos"] = seguimiento.no_creditos
        fila["tipo"] = 2
        #fila["payment_ref"] = payment.id
        fila["credit_id"] = credit.id 
        fila["fecha_corte"] = fecha
        tabla << fila
      end
     return tabla
    end
    
    def self.tablero_por_creditos_guardados(credits,fecha)
      tabla = []
      credits.each do |credit|
        tablero  = Tablero.all.where("credit_id = ? and fecha_corte = ?", credit.id, fecha.to_date)[0]
        if tablero.nil?
          next if credit.status == 3
          tabla << self.generador_de_tuplas_tablero(credit,fecha)
          next
        end
        fila = Hash.new()
        fila["nombre_completo"] = "#{credit.nombre_completo_deudor}"
        fila["fecha"] = credit.fecha_de_contrato
        fila["monto_solicitud"] = credit.monto_solicitud
        fila["monto_a_pagar"] = credit.payments.sum(:importe)
        fila["pagado"] = Ticket.joins(:payment=>:credit).where("credits.id = ? and tickets.status = ?",credit.id,0).sum(:cantidad)
        fila["adeudo"] = fila["monto_a_pagar"].to_s.to_d - fila["pagado"].to_s.to_d
        fila["pagar"] = tablero.a_pagar
        pagos = Payment.all.where("credit_id = ? and fecha_de_corte < ?", credit.id, fecha)
        #pagos = Payment.all.where("credit_id = ? and fecha_de_corte < ? updated_at", credit.id, fecha,fecha)
        fila["atrasado"] = tablero.atrasado
        fila["interes_moratorio"] = tablero.interés_moratorio
        fila["total_a_cobrar"] =  tablero.total_a_cobrar
        quitar =  (credit.id == 982 and fecha == "13/10/2018".to_date)? 20: 0
        fila["adelantado"] = Ticket.joins(:payment=>:credit).where("credits.id = ? and payments.fecha_de_corte > ? and tickets.status = ? and tickets.updated_at > ?",credit.id, fecha, 0, fecha).sum(:cantidad) - quitar
        #fila["cobrado"] = Payment.joins(:tickets).where("credit_id = ? and fecha_de_corte = ? and tickets.status = 0 and tickets.created_at >= ? ", credit.id, fecha,fecha).sum(:cantidad)
        fila["cobrado"] = Ticket.where(updated_at:credit.product.rangoDeCorte(fecha)).joins(:payment=>:credit).where("tickets.status = ?",0).where("payments.credit_id = ?",credit.id).sum("tickets.cantidad") - fila["adelantado"]
        fila["diferencia"] = fila["total_a_cobrar"].to_s.to_d - fila["cobrado"].to_s.to_d
       
        fila["empresa"] = credit.padre.nombre_completo
        fila["numero_de_pago"] = tablero.no_pago
        fila["numero_de_creditos"] = tablero.no_creditos
        fila["tipo"] = 2
        #fila["payment_ref"] = payment.id
        fila["credit_id"] = credit.id 
        fila["fecha_corte"] = fecha
        fila["estatus"] = Payment.select(:estatus)
        tabla << fila
      end
     return tabla
    end
    
    def self.vencimientos
        Expire.create(comentarios:"vencimiento",fecha:Time.now.to_date,afectados:0) 
        Coman.create(c:"entro  Auxiliar.vencimientos 2")
        Product.all.each do |p|
          p.vencer
        end
    end
    
    def self.getArreglo(product,fecha)
      puts "get arreglo"
      @product = product
      
      cantidad= @product.payout.getDays.length
      fin_mes= @product.payout.getDays.include? "-1"
      dias=  @product.payout.getDays - ["-1"]
      cortes =  @product.payout.getFlow.sort!
      dias_int =[]
      cortes_int = []
      dias.each do |i|
        dias_int.push(i.to_i)
      end
      dias_int.sort!
      dias.push("-1") if fin_mes
      dia_inicial = nil;
      cortes.each do |i |
        cortes_int.push(i.to_i)
      end
      cortes_int.sort!
        cont = 0
        dias.each do |dia|
           dia= fecha.end_of_month.day if dia=="-1"
           if fecha.day<=dia.to_i
             if fecha.day <=Auxiliar.inferior(dia,cortes_int)
              dia_inicial=cont
              puts "dia #{dia}"
              break
             end
           end
           cont +=1
        end
          
          if dia_inicial==nil
            dia_inicial = 0
          end
          puts "dia inicial #{dia_inicial}"
          puts dias
          
          aux= Auxiliar.getFecha(dias,dia_inicial,1,fecha,cortes_int,@product)

  end
  
  def self.getFecha(dias,inicio,contador,fecha,cortes,product)
    puts "get fecha"
    puts ".... #{fecha}"
    @product = product
    fechas = Hash.new
    contador = contador + inicio
    index =(contador)%dias.length
    avance = 0
    case @product.payout.type_payout
    when 0
      avance = contador%dias.length==0?1.week : 0.week unless contador==0
      avance = 1.week if (fecha.to_date.wday.to_int-1) >= cortes.max && contador==0
      fechas["pago"] = fecha.beginning_of_week+(dias[index].to_i-1).day+avance
      fechas["corte"] = fechas["pago"].beginning_of_week+Auxiliar.inferior(fechas["pago"].day,cortes).days-1.days
      fechas["impresion"] = fechas["corte"] - (@product.payout.desplazamiento).to_i.days
      
    when 1
      avance = contador%dias.length==0?1.month : 0.month unless contador==0
      avance = 1.month if fecha.to_date.day.to_int >= cortes.max && contador==0
      fechas["pago"] = (dias[index].to_i==-1?fecha.end_of_month : fecha-fecha.day.day+dias[index].to_i.day)+avance
      fechas["corte"] = fechas["pago"].beginning_of_month+Auxiliar.inferior(fechas["pago"].day,cortes).days-1.days
      fechas["impresion"] = fechas["corte"] - (@product.payout.desplazamiento).to_i.days
    end
    return fechas
  end
  
   def self.inferior(val,array)
    array.sort!
    array.reverse!
    array.each do |n|                                                                                                                                                                                                                   
      return n.to_i if val.to_i > n.to_i
    end
    return val.to_i
   end
 
end
