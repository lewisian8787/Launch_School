class Clock
  attr_reader :time 

  def initialize(time = '00:00')
    @time = time
  end

  def self.at(hour, minutes = 0)
    formatted_time = format("%02d:%02d", hour, minutes)
    Clock.new(formatted_time)
  end

  def +(minutes)
    hours, current_minutes = @time.split(':').map(&:to_i)

    total_minutes = current_minutes + minutes

    new_hours = hours + (total_minutes / 60)
    new_minutes = total_minutes % 60

    new_hours = new_hours % 24

    new_time = format("%02d:%02d", new_hours, new_minutes)

    Clock.new(new_time)
  end
  
   def -(minutes)
    hours, current_minutes = @time.split(':').map(&:to_i)
    new_minutes = current_minutes - minutes 
    hours == 0 ? new_hours = 24 : new_hours = hours

    if new_minutes < 0
      new_minutes = 60 - new_minutes.abs
      new_hours -= 1
    end

    new_time = format("%02d:%02d", new_hours, new_minutes)

    Clock.new(new_time)
  end
  
  def to_s
    @time
  end
end