class Expire < ActiveRecord::Base
      validates_uniqueness_of :created_at
      validates_uniqueness_of :control
      before_validation :vencer, on: [ :create ]
 
  private
    def vencer
        Coman.create(c:"hola prueba #{Time.now} expire: #{self.control}")
    end
end
