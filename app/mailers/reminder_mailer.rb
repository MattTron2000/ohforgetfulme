class ReminderMailer < ActionMailer::Base
    default :from => "matthewhamilton23@yahoo.ca"
    def welcome_email(remind)
        @url  = "http://ohforgetful.me"
        @remind = remind
        mail(:to => @remind.contactinfo, :subject => "Welcome to Oh Forgetful Me!")
    end

    def reminder_email(remind)
        @remind = remind
        @url = "http://ohforgetful.me"
        @date = @remind.date.to_formatted_s(:long_ordinal)
        mail(:to =>remind.contactinfo, :subject => remind.name+" reminder from OhForgetful.Me")
    end
end
