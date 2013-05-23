
class Remind < ActiveRecord::Base
    def findreminderstodo(reminds)
        reminds.each do |name|
            if date.now > reminds.date
                if time.now > reminds.time
            
        end

    end

        
end
