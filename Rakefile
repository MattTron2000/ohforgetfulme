# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Ohforgetfulme::Application.load_tasks
desc "Starts the Scheduler worker"
task :scheduler do
  require 'C:\\Users\Matt\Documents\Programming\ohforgetfulme\scheduler.rb'
  scheduler.join
end