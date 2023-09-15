class DisposicionesPdf < Prawn::Document
  def initialize(credit)
    super(:margin => [0,0,0,0])
    @credit = credit 
    text_content

  end
  def text_content
      
      image open("#{Rails.root}/app/pdf/disposiciones1.jpg"), position: :center , :width=>560, :height=>790
      image open("#{Rails.root}/app/pdf/disposiciones2.jpg"), position: :center , :width=>560, :height=>790
      image open("#{Rails.root}/app/pdf/disposiciones3.jpg"), position: :center , :width=>560, :height=>790
      
  end
end
