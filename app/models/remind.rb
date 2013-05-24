
class Remind < ActiveRecord::Base
    def self.find_reminders_todo
        sent = 0
        Remind.all.each do |x|
            if Time.now > x.date
                # ReminderMailer.reminder_email(x).deliver
                sent += 1
            end
        end  
        return sent
    end
end
