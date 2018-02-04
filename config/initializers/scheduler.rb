
require 'rufus-scheduler'
scheduler = Rufus::Scheduler.new
unless scheduler.down?
#  scheduler.cron '0 22 * * *' do
#    Coman.create(c:"#{Time.now} yaaaa jala")
#  end
  scheduler.every("10m") do
    Expire.create(comentarios:"vecimiento de prueba2 #{Auxiliar.fecha_natural Time.now}",fecha:Time.now, control:(Expire.last.nil?)? 1 : Expire.last.id + 1 )
  end
end

