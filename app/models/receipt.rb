class Receipt < ActiveRecord::Base
    belongs_to :payment
    before_create do
    self.folio = self.maximum('follio') + 1
    if Receipt.count==0
            self.folio=0
        end
  end
   def recibo
    pdf = ReciboPdf.new(@credit)
    send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
  end
end
