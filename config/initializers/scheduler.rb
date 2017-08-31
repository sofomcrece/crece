require 'rufus-scheduler'

Rufus::Scheduler.singleton.cron '5 0 * * *' do
  # every minute

  Coman.create(c:"#{Time.now} se creo")
end