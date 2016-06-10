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

User.create(
email:'luisesh1x10@hotmail.com',
password:'luisesh1',
tipo:1,
app:'luis',
apm:'luis',
nom1:'luis',
nom2:'luis',
RFC:'ddd333333fff',
CURP:'luis',
seguro:'luis',
INE:'luis',
nacionalidad:'luis',
fecha_nacimiento:'17/10/1994',
nac_ciudad:'luis',
nac_estado:'luis',
nac_pais:'luis',
sexo:true,
telefono_casa:'luis',
telefono_celular:'luis',
correo1:'luis',
correo2:'luis',
calle:'luis',
numero_int:555,
numero_ext:555,
colonia:'luis',
codigo_postal:45,
municipio:'luis',
estado:'luis',
pais:'luis',
Alias:'luisesh1')