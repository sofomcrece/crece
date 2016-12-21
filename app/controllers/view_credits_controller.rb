class ViewCreditsController < ApplicationController
   before_action :set_credit, only: [:autorizacion,:caratula,:contrato,:entrevista,:poliza,:corrida,:documentos]
  before_action :set_credits, only:[:show, :edit, :update, :destroy]
  def index
    @credits = Credit.all.where(status:0)
  end
  def aceptadas
    @credits = Credit.all.where(status:1)
  end
  def rechazadas
    @credits = Credit.all.where(status:2)
  end
  # GET /credits/1
  # GET /credits/1.json
  def show
  end
  def documentos
    
  end
  def autorizacion
    pdf = AutorizacionPdf.new(@credit)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
    #filename = "#{Rails.root}/app/pdf/autorizacion_en_blanco.pdf"
    #Prawn::Document.generate("full_template.pdf", :template => filename) do
    #  text "THis content is written on the first page of the template", :align => :center
    #end
  end
  def caratula
    pdf = CaratulaPdf.new(@credit)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
  end
  def contrato
    pdf = ContratoPdf.new(@credit)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
  end
  def entrevista
    pdf = EntrevistaPdf.new(@credit)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
  end
  def poliza
    pdf = PolizaPdf.new(@credit)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
  end
  def corrida
    @total= @credit.monto_solicitud.to_f + @credit.monto_solicitud.to_f * (@credit.product.taza_de_interes_ordinaria/100)
    @pago = @total/@credit.product.numero_de_pagos_a_realizar
    @capital = @pago/(1 + (@credit.product.taza_de_interes_ordinaria / 100))
    @interes = (@capital * ( @credit.product.taza_de_interes_ordinaria / 100))/ (1+ ((@credit.product.taza_de_interes_ordinaria - @credit.product.cat_sin_iva)/ 100))
    @iva = @interes*(@credit.product.taza_de_interes_ordinaria - @credit.product.cat_sin_iva)/100
    fecha = @credit.fecha
    @arreglo = []
    @arreglo.push(["PERIODO", "FECHA DE PAGO", "SALDO INICIAL", "CAPITAL", "INTERES", "IVA DE INTERES", "PAGO TOTAL", "SALDO FINAL"])
    @credit.product.numero_de_pagos_a_realizar.times do |n|
    @arreglo.push([ "#{n+1}","#{(n%2==1)? fecha=fecha+15.day : fecha=fecha.end_of_month}","$#{(@total-((n)*@pago)).round(2)}","$#{@capital.round(2)}","$#{@interes.round(2)}","$#{@iva.round(2)}","$#{@pago.round(2)}","$#{((@total-((n)*@pago))-@pago).round(2)}"])
  end
    pdf = CorridaPdf.new(@credit,@arreglo)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
    
    
  end
  
 def set_credit
      @credit = Credit.find(params[:clave])
 end
 def set_credits
      @credit = Credit.find(params[:id])
 end
 
end
