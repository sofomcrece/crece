class PaymentsController < ApplicationController
  
 def index
    #suc = params[:sucursal]
    age_o_emp = params[:ageoemp]
    padre = params[:padre].to_i
    fecha = params[:fecha]
    prod = params[:producto].to_i
    @credits = Credit.all.where(status:1)
    @payments=  Payment.joins(:credit).where("credits.status = ? ",1)
    @payments =@payments.where("credits.referencia_agenteEmpresa = ? and  credits.agente_empresa = ? ",padre,age_o_emp) unless  params[:ageoemp].nil? or params[:ageoemp]=="" or params[:padre].nil? or params[:padre]==""
    @payments = @payments.where(fecha_de_impresion:fecha) unless params[:fecha].nil? or params[:fecha] == ""
    @payments = @payments.where("credits.product_id = ? ",prod) unless params[:producto].nil? or params[producto] == ""
  end
  def dates
  end
  def show
    @credit = Credit.find(params[:clave]) unless params[:clave].nil? || params[:clave]==""
    
  end
end
