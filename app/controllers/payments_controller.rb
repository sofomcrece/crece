class PaymentsController < ApplicationController
  
 def index
    suc = params[:sucursal]
    emp = params[:empresa]
    @credits = Credit.all.where(status:1)
  end
  def dates
  end
  def show
    @credit = Credit.find(params[:clave]) unless params[:clave].nil? || params[:clave]==""
    
  end
end
