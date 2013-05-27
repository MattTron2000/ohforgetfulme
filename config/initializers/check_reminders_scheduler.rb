require 'rubygems'
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.every "10m" do
    Remind.find_reminders_todo
end
