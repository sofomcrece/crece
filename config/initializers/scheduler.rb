
require 'rufus-scheduler'
scheduler = Rufus::Scheduler.new
unless scheduler.down?
#  scheduler.cron '0 22 * * *' do
#    Coman.create(c:"#{Time.now} yaaaa jala")
#  end
  scheduler.every("60s") do
    Expire.create(comentarios:"vecimiento de prueba #{Auxiliar.fecha_natural Time.now}",fecha:Time.now)
  end
end

