class Payout < ActiveRecord::Base
    has_many :products
    def getDays
        self.days.split(',')
    end
    def getFlow 
        self.flow.split(',')
    end
    
    #flow = 0 semanal 
    #flow = 1 mensual 
    #flow = 2 anual 
    
end
