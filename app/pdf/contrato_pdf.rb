class ContratoPdf < Prawn::Document
  def initialize(credit)
    super(:margin => [0,0,0,0])
    @credit = credit 
    text_content
  end
  def text_content
      image open("#{Rails.root}/app/pdf/contrato_en_blanco1.jpg"), position: :center , :width=>560, :height=>790
      draw_text  "#{@credit.nombre_completo_familiar_1}", :at => [0,500]
  end
end
