# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Loan.create([{nombre:'Arrendamiento financiero'},
            {nombre:'Credito de auto'},
            {nombre:'Credito de habilitacion o AVIO'},
            {nombre:'Credito en cuenta corriente'},
            {nombre:'Credito hipotecario'},
            {nombre:'Credito personal'},
            {nombre:'Credito quirografario'},
            {nombre:'Credito refaccionario'},
            {nombre:'Credito simple'},
            {nombre:'Factoraje finaciero'},
            {nombre:'Tarjeta de credito'}])
            
Payout.create([{nombre:'Al vencimiento'},
                {nombre:'Anual'},
                {nombre:'Catorcenal'},
                {nombre:'Diaria'},
                {nombre:'Mensual'},
                {nombre:'Quincenal'},
                {nombre:'Semanal'},
                {nombre:'Semestral'},
                {nombre:'Trimestral'}])