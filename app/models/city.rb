class City < ActiveRecord::Base
    require 'json'
    def self.loadJson(val)
        puts "city"
        return if val.nil?
        elementos = JSON.parse(val)
        elementos.each do |elemento|
             self.create(cve_estado:elemento["cve_estado"].to_s.strip!,dc_estado:elemento["dc_estado"].to_s.strip!,cve_localidad_inegi:elemento["cve_localidad_inegi"].to_s.strip!,dc_localidad_inegi:elemento["dc_localidad_inegi"].to_s.strip!,cve_municipio_siti_codigo_postal:elemento["cve_municipio_siti_codigo_postal"].to_s.strip!,dc_municipio_siti:elemento["dc_municipio_siti"].to_s.strip!,cve_colonia_siti_colonia:elemento["cve_colonia_siti_colonia"].to_s.strip!)
        end
    end
end
