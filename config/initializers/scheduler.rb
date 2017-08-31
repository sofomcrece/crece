require 'rufus-scheduler'

Rufus::Scheduler.singleton.every("10s") do
  # every minute

  Coman.create(c:"se creo")
end