class CorridaPdf < Prawn::Document
  def initialize(credit)
    super(:margin => [0,0,0,0])
    @credit = credit 
    text_content
  end
  
  def header
    #This inserts an image in the pdf file and sets the size of the image
   
  end
  
  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 0

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    
      table_content
  end

  def table_content
    table  product_rows,:cell_style => { size: 5,border_width:0} do
      row(0).font_style = :bold
      self.header = true
    end
  end

  def product_rows
    [['Peridodo', 'fecha de pago', 'Saldo inicial', 'Capital', 'Interes', 'IVA de interes', 'Pago Total', 'Saldo final' ]] +
      total= @credit.monto_solicitud.to_f + @credit.monto_solicitud.to_f * 0.26
      pago = total/12
      interes =pago*0.26
      capital = pago-interes
      iva = interes*0.16
      
      [1..12].each do |n|
      [n, @credit.fecha, total-((n-1)*pago),capital,interes,iva,pago,"hola" ]
    end
  end
end
