class PolizaPdf < Prawn::Document
  def initialize(credit)
    super(:margin => [0,0,0,0])
    @credit = credit 
    text_content
  end
  def text_content
    rectangle [50,750], 500, 250
    draw_text  "FINANCIERA MARJO S.A DE C.V. SOFOM ENR",:size=>9, :at => [70,720]
    draw_text  "RIO  NAZASA 1240 LOS PINOS",:size=>9, :at => [70,710]
    draw_text  "CULIACAN DE ROSALES, SINALOA CP: 80128",:size=>9, :at => [70,700]
    draw_text  "#{@credit.RFC}",:size=>9, :at => [70,690]
    draw_text  "SUCURSAL: #{@credit.padre.branch_office.nombre}",:size=>9, :at => [70,680]
    
    draw_text  "Original ", :at => [460,730]
    draw_text  "FECHA ",:size=>9, :at => [460,710]
    draw_text  "#{@credit.fecha_en_español}", :size=>9, :at => [430,703]
    
    draw_text  "#{@credit.apellido_paterno} #{@credit.apellido_materno} #{@credit.nombre_1} #{@credit.nombre_2}", :at => [70,650]
    draw_text  "$#{ @credit.monto_solicitud}", :at => [430,650]
    draw_text  "______________________________________________________________________", :at => [70,650]
    draw_text  "Paguese este cheque a:",:size=>8, :at => [70,635]
    draw_text  "Moneda  nacionalidad",:size=>8, :at => [450,635]
    draw_text  "($#{ @credit.monto_solicitud} pesos 00/100 M.N. )",:size=>9, :at => [70,620]
    draw_text  "______________________________________________________________________", :at => [70,620]
    draw_text  "La cantidad de: ",:size=>8, :at => [70,610]
    
    image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45, :at => [70,600]
    
    draw_text  "_________________________", :at => [370,580]
    draw_text  "FIRMA CHEQUE RECIBIDO",:size=>8, :at => [400,570]
    
    draw_text  "BANCO:  #{@credit.padre.branch_office.banco}  ",:size=> 9, :at => [70,520]
    draw_text  "CUENTA:  #{@credit.padre.branch_office.cuenta}  ",:size=> 9, :at => [170,520]
    draw_text  "CHEQUE:  #{@credit.numero_de_cheque}  ",:size=> 9, :at => [270,520]
    draw_text  "AGENTE:  #{@credit.padre.clave}  ",:size=> 9, :at => [370,520]
    
    rectangle [50,350], 500, 250 
    
    
    
    des = -400 
    
    draw_text  "FINANCIERA MARJO S.A DE C.V. SOFOM ENR",:size=>9, :at => [70,720+des]
    draw_text  "RIO  NAZASA 1240 LOS PINOS",:size=>9, :at => [70,710+des]
    draw_text  "CULIACAN DE ROSALES, SINALOA CP: 80128",:size=>9, :at => [70,700+des]
    draw_text  "#{@credit.RFC}",:size=>9, :at => [70,690+des]
    draw_text  "SUCURSAL: #{@credit.padre.branch_office.nombre}",:size=>9, :at => [70,680+des]
    
    draw_text  "Copia ", :at => [460,730+des]
    draw_text  "FECHA ",:size=>9, :at => [460,710+des]
    draw_text  "#{@credit.fecha_en_español}", :size=>9, :at => [430,703+des]
    
    draw_text  "#{@credit.apellido_paterno} #{@credit.apellido_materno} #{@credit.nombre_1} #{@credit.nombre_2}", :at => [70,650+des]
    draw_text  "$#{ @credit.monto_solicitud}", :at => [430,650+des]
    draw_text  "______________________________________________________________________", :at => [70,650+des]
    draw_text  "Paguese este cheque a:",:size=>8, :at => [70,635+des]
    draw_text  "Moneda  nacionalidad",:size=>8, :at => [450,635+des]
    draw_text  "($#{ @credit.monto_solicitud} pesos 00/100 M.N. )",:size=>9, :at => [70,620+des]
    draw_text  "______________________________________________________________________", :at => [70,620+des]
    draw_text  "La cantidad de: ",:size=>8, :at => [70,610+des]
    
    image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45, :at => [70,600+des]
    
    draw_text  "_________________________", :at => [370,580+des]
    draw_text  "FIRMA CHEQUE RECIBIDO",:size=>8, :at => [400,570+des]
    
    draw_text  "BANCO:  #{@credit.padre.branch_office.banco}  ",:size=> 9, :at => [70,520+des]
    draw_text  "CUENTA:  #{@credit.padre.branch_office.cuenta}  ",:size=> 9, :at => [170,520+des]
    draw_text  "CHEQUE:  #{@credit.numero_de_cheque}  ",:size=> 9, :at => [270,520+des]
    draw_text  "AGENTE:  #{@credit.padre.clave}  ",:size=> 9, :at => [370,520+des]
    stroke
  end
end
