
require 'rufus-scheduler'
scheduler = Rufus::Scheduler.new(:lockfile => ".rufus-scheduler.lock")
unless scheduler.down?
  scheduler.cron '0 22 * * *' do
    Coman.create(c:"#{Time.now} yaaaa jala")
  end
  scheduler.every("60s") do
    Coman.create(c:"#{Time.now} abierto")
  end
end