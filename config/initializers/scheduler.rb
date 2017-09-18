require 'rufus-scheduler'
scheduler = Rufus::Scheduler.new
scheduler.cron '39 21 * * *' do
  Coman.create(c:"#{Time.now} se creo")
end
