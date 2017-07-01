class PaymentsController < ApplicationController
  
 def index
    require 'json'
    #suc = params[:sucursal]
    padres = params[:padres]
    padres = JSON.parse params[:padres] unless  params[:padres].nil? or params[:padres]==""
    fecha = params[:fecha].to_date unless params[:fecha].nil? 
    prod = params[:producto].to_i
    @credits = Credit.all.where(status:1)
    @payments=  Payment.joins(:credit).where("credits.status = ? ",1)
    @payments = @payments.where(fecha_de_impresion:fecha) unless params[:fecha].nil? or params[:fecha] == ""
    @payments = @payments.where("credits.product_id = ? ",prod) unless params[:producto].nil? or params[producto] == ""
    cad = ""
    i =0
    unless padres.nil?
      padres.each do |padre|
        cad = cad + " OR " unless i==0
        cad = cad + "credits.referencia_agente_empresa = #{padre["padre"].to_i} and  credits.agente_empresa = #{padre["tipo"].to_i}"  unless  params[:padres].nil? or params[:padres]==""
        i=i+1
      end
    end
    @payments = @payments.where(cad) unless  cad==""
  end
  def dates
  end
  def show
    @credit = Credit.find(params[:clave]) unless params[:clave].nil? || params[:clave]==""
  end
end
