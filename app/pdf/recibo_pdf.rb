class ReciboPdf < Prawn::Document
  def initialize(credit)
    super(:margin => [0,0,0,0])
    @credit = credit 
    text_content
  end
  def text_content
      
      des = 0
    rectangle [50,750+des], 500, 170
    
    image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45, :at => [70,740+des]
    draw_text  "FOLIO",:size=>9, :at => [400,720+des]
    draw_text  "FECHA CARGO: ",:size=>9, :at => [400,710+des]
    draw_text  "SUCURSAL: ",:size=>9, :at => [400,700+des]
    draw_text  "AGENTE: ",:size=>9, :at => [400,690+des]

    
    draw_text  "Original ", :at => [400,730+des]
    
    draw_text  "RECIBO DE: #{@credit.apellido_paterno} #{@credit.apellido_materno} #{@credit.nombre_1} #{@credit.nombre_2}",:size=>9, :at => [70,670+des]
    draw_text  "LA CANTIDAD DE: ?",:size=>9, :at => [70,660+des]
    draw_text  "LA CANTIDAD DE: ?",:size=>9, :at => [70,650+des]
    draw_text  "POR CONCEPTO DE: ?",:size=>9, :at => [70,640+des]
    draw_text  "ATRASADO ACTUAL DE: ",:size=>9, :at => [70,630+des]
    
    draw_text  "_________________________", :at => [370,610+des]
    draw_text  "FIRMA CHEQUE RECIBIDO",:size=>8, :at => [400,600+des]
    
    
  
    stroke
  end
end
