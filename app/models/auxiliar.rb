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
     def self.mes(val)
        case val
        when 1
            cad = "Enero"
        when 2
            cad = "Febrero"
        when 3
            cad = "Marzo"
        when 4
            cad = "Abril"
        when 5
            cad = "Mayo"
        when 6
            cad = "Junio"
        when 7
            cad = "Julio"
        when 8
            cad = "agosto"
        when 9
            cad = "Septiembre"
        when 10
            cad = "Octubre"
        when 11
            cad = "Noviembre"
        when 12
            cad = "Diciembre"
        else
            cad = "mes invalido"
        end
        return cad
    end
    def self.fecha_natural(f)
      return nil if f.nil?
      cad = f.strftime("%d") + " de #{self.mes(f.strftime("%m").to_i)} del #{f.strftime("%Y")}"  
    end
    def self.fecha_formato(f)
      return nil if f.nil?
      return f.strftime("%d/%m/%Y")
    end
    def self.folio(val)
      return "2503616176B#{"0"*(5-val.to_s.length)+val.to_s}"
    end
end
