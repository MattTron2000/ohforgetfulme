
class Remind < ActiveRecord::Base
    validates :contactinfo, :presence => true
    validates :name , :presence => true
    validates :date, :presence => true

    def self.find_reminders_todo
        sent = 0
        Remind.all.each do |x|
            if Time.now >= x.date
                if x.done == nil
                    x.done = true
                    x.save 
                    ReminderMailer.reminder_email(x).deliver
                    sent += 1
                end
            end
        end  
        return sent
    end
end
