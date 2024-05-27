class Clock
    attr_accessor :hourly_time, :minutes_time
    
    def self.at(hour, minutes = 0)
        instance = Clock.new
        if minutes.to_s.length < 2 
            instance.minutes_time = 
            
        instance.minutes_time = minutes if minutes != nil
        instance.hourly_time = hour
        instance
    end
    
    def to_s
        current_hour = "00"
        current_minutes = "00"
        returned_time = "#{current_hour}:#{current_minutes}"
        
        if self.hourly_time <= 10
            current_hour = "0#{hourly_time}"
        else
            current_hour = "#{hourly_time}"
        end
        
        if self.minutes_time != nil && self.minutes_tine <= 10
            current_minutes = "0#{minutes_time}"
        else
            current_minutes = "#{minutes_time}"
        end 
        
        returned_time 
    end
end

p Clock.at(8).to_s