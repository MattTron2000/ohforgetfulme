class ReminderMailer < ActionMailer::Base
    default :from => "matthewhamilton23@yahoo.ca"
    def welcome_email(remind)
        @url  = "http://ohforgetful.me"
        @remind = remind
        mail(:to =>@remind.email, :subject => "Welcome to Oh Forgetful Me!")
    end

    def reminder_email(remind)
        @remind = remind
        @url = "http://ohforgetful.me"
        mail(:to =>@remind.email, :subject =>@remind.name+" reminder from OhForgetful.Me")
    end
end
