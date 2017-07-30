class Auxiliar < ActiveRecord::Base
    def self.casa_nombre(val)
        case val
        when 0    #compare to 1
          return "Propia" 
        when 1    #compare to 2
          return "Familiar"
        when 2    #compare to 2
          return "Rentada"
        when 3    #compare to 2
          return "Hipoteca"
        else
            return "desconocido"
        end
    end
    def self.escolaridad_nombre(val)
        case val
        when 0    #compare to 1
          return "Primaria" 
        when 1    #compare to 2
          return "Secundaria"
        when 2    #compare to 2
          return "Preparatoria"
        when 3    #compare to 2
          return "Tecnico"
        when 4    #compare to 2
          return "Licenciatura"
        when 5    #compare to 2
          return "Posgrado"
        when 6    #compare to 2
          return "Sin estudios"
        else
            return "desconocido"
        end
    end
    def self.estado_civil_nombre(val)
        case val
        when 0    #compare to 1
          return "Soltero" 
        when 1    #compare to 2
          return "Casado"
        when 2    #compare to 2
          return "Divorciado"
        when 3    #compare to 2
          return "Union libre"
        when 4
          return "Viudo"
        else
            return "desconocido"
        end
    end
end
