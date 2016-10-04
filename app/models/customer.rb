class Customer < ActiveRecord::Base
  belongs_to :economical_activity
  belongs_to :country
  validates :RFC, uniqueness: true
  validates :CURP, uniqueness: true
  def nombres 
    self.nombre_1 + " " + self.nombre_2
  end
end
