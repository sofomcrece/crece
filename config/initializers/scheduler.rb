
#require 'rufus-scheduler'
#scheduler = Rufus::Scheduler.new
#unless scheduler.down?
#  scheduler.cron '0 22 * * *' do
#    Coman.create(c:"#{Time.now} yaaaa jala")
#  end
#  scheduler.every("60s") do
#    Coman.create(c:"#{Time.now} abierto")
#  end
#end

def rufus_running?(s)
  return false unless s.up?
  return false unless s.thread.alive?
  true
end

def is_rufus_scheduler_already_running_in_my_rails_application?

  return false unless defined?(Rufus::Scheduler)

  ObjectSpace.each_object do |o|
    next unless o.is_a?(Rufus::Scheduler)
    return true if rufus_running?(o)
  end

  false
end
alias rufus? is_rufus_scheduler_already_running_in_my_rails_application?


require 'rufus-scheduler'
scheduler = Rufus::Scheduler.new
if rufus?
  scheduler.cron '0 22 * * *' do
    Coman.create(c:"#{Time.now} yaaaa jala")
  end
  scheduler.every("10s") do
    Coman.create(c:"#{Time.now} abierto")
  end
end