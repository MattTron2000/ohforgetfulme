require "app/models/remind.rb"
require 'rufus/scheduler'

class Scheduler
 def start
   scheduler = Rufus::Scheduler.start_new
   scheduler.every '20s', :blocking =>; true do
      puts "running file with Rufus-Scheduler"
     `ruby remind.rb`
   end
   scheduler.join
 end
end

Scheduler.new.start