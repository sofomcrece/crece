require 'rubygems'
require 'rufus-scheduler'
scheduler = Rufus::Scheduler.new
scheduler.cron '0 22 * * *' do
  Coman.create(c:"#{Time.now} se creo")
end
scheduler.interval '10s' do
  Coman.create(c:"I assure you! It's #{Time.now}")
end
