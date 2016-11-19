class CaratulaPdf < Prawn::Document
  def initialize(credit)
    super(:margin => [0,0,0,0])
    @credit = credit 
    text_content
  end
  def text_content
      image open("#{Rails.root}/app/pdf/caratulacredito_en_blanco.jpg"), position: :center , :width=>560, :height=>790
      draw_text  "26%",:size=>9, :at => [200,610]
      draw_text  "$#{@credit.monto_solicitud}",:size=>9, :at => [340,610]
      draw_text  "$#{ @credit.monto_solicitud.to_f + (@credit.monto_solicitud.to_f * 0.26)}",:size=>9, :at => [440,610]
      draw_text  "12 quincenas",:size=>9, :at => [100,570]
      draw_text  "dia 15 y 30 de cada mes",:size=>9, :at => [260,570]
      draw_text  "dia 15 y 30 de cada mes",:size=>9, :at => [280,579]
      draw_text  "10",:size=>9, :at => [180,501]
      draw_text  "#{@credit.calle} #{@credit.codigo_postal} #{@credit.colonia}",:size=>9, :at => [100,232]
      draw_text  "#{@credit.telefono_celular}",:size=>9, :at => [100,215]
      draw_text  "reca",:size=>9, :at => [240,123]
  end
end
