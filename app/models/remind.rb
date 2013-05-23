
class Remind < ActiveRecord::Base
    def self.findreminderstodo(remind)
        remind.each do |remind|
            if date.now > remind.date
                if remind.done == nil
                    ReminderMailer.reminder_email(remind)
                    remind.done = true
                end
            end
        end
    end 
end
