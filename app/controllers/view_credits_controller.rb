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
    pdf = CorridaPdf.new(@credit)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
  end
 def set_credit
      @credit = Credit.find(params[:clave])
 end
 def set_credits
      @credit = Credit.find(params[:id])
 end
 
end
