class AutorizacionPdf < Prawn::Document
  def initialize(credit)
    super(:margin => [0,0,0,0])
    @credit = credit 
    text_content
  end
  def text_content
      image open("#{Rails.root}/app/pdf/autorizacion_en_blanco.jpg"), position: :center , :width=>560, :height=>790
      draw_text  "#{@credit.apellido_paterno} #{@credit.apellido_materno} #{@credit.nombre_1} #{@credit.nombre_2}",:size=>8, :at => [60,455]
      draw_text  "#{@credit.RFC} ",:size=>8, :at => [100,418]
      draw_text  "#{@credit.calle}, ##{@credit.numero_exterior}",:size=>8, :at => [120,405]
      draw_text  "#{@credit.colonia} ",:size=>8, :at => [100,395]
      draw_text  "#{@credit.localidad} ",:size=>8, :at => [100,385]
      draw_text  "#{@credit.estado_actual} ",:size=>8, :at => [270,385]
      draw_text  "#{@credit.codigo_postal} ",:size=>8, :at => [470,385]
      draw_text  "#{@credit.fecha.strftime("%d-%m-%Y")} ",:size=>8, :at => [270,370]
      draw_text  "clave ",:size=>8, :at => [140,205]
      draw_text  "#{Time.now.strftime("%d-%m-%Y")} ",:size=>8, :at => [230,195]
      draw_text  "#{@credit.id}",:size=>8, :at => [200,185]
      
  end
end
