
class Remind < ActiveRecord::Base
    validates :name , :presence => true
    validates :date, :presence => true
    validates :email, :presence => true

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

    def self.welcome_email(passedRemind)
        found = false
        Remind.all.each do |table|
            if passedRemind.email == table.email
                found = true
            end
        end
        if found == false
            ReminderMailer.welcome_email(passedRemind).deliver
        end
        return found
    end

end
