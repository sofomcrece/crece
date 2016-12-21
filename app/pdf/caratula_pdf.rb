class CaratulaPdf < Prawn::Document
  def initialize(credit)
    super(:margin => [0,0,0,0])
    @credit = credit 
    text_content
  end
  def text_content
      image open("#{Rails.root}/app/pdf/caratulacredito_en_blanco.jpg"), position: :center , :width=>560, :height=>790
      draw_text  "#{@credit.product.taza_de_interes_ordinaria}%",:size=>9, :at => [200,610]
      draw_text  "$#{(@credit.monto_solicitud)}",:size=>9, :at => [340,610]
      draw_text  "$#{ @credit.monto_solicitud.to_f + (@credit.monto_solicitud.to_f * (@credit.product.taza_de_interes_ordinaria/100))}",:size=>9, :at => [440,610]
      draw_text  "12 quincenas",:size=>9, :at => [100,570]
      draw_text  "dia 15 y 30 de cada mes",:size=>9, :at => [260,570]
      draw_text  "dia 15 y 30 de cada mes",:size=>9, :at => [280,579]
      draw_text  "#{@credit.product.taza_de_interes_moratoria}",:size=>9, :at => [175,501]
      draw_text  "#{Conf.last.domicilio}",:size=>9, :at => [100,232]
      draw_text  "#{Conf.last.telefono}",:size=>9, :at => [100,215]
      draw_text  "#{Conf.last.correo}",:size=>9, :at => [400,215]
      draw_text  "#{@credit.product.registro_del_contrado_de_adhesion}",:size=>9, :at => [240,123]
  end
end
