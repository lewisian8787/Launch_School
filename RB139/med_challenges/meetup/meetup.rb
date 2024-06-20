require 'date'

class Meetup
  attr_reader :descriptor, :year, :month
  DESCRIPTOR_CONV = {'first' => 1, 'second' => 2, 'third' => 3, 'fourth' => 4, 'fifth' => 5, }
  
  def initialize(year, month)
      @year = year 
      @month = month
  end
  
  def day(day, descriptor)
      temp_date_obj = Date.civil(year, month, -1)
      #day is 'Monday' and descriptor is 'first' currently
      #-1 sets the day of 'temp_date_obj' to the last day of that respective month
      correct_days = []
      (1..temp_date_obj.day).each do |day_of_month|
        date_obj = Date.civil(year, month, day_of_month)
          correct_days << day_of_month if date_obj.send("#{day.downcase}?")
      end

      if descriptor.downcase == 'last' || descriptor.downcase == 'teenth'
        return_new_day(correct_days, descriptor)
      else
        DESCRIPTOR_CONV[descriptor.downcase] > correct_days.length ? faulty_new_day : return_new_day(correct_days, descriptor)
      end
  end
  
  def faulty_new_day
    nil
  end

  def return_new_day(correct_days_array, current_descriptor)
    new_day = case current_descriptor.downcase
    when 'first' then correct_days_array.first
    when 'second' then correct_days_array[1]
    when 'third' then correct_days_array[2]
    when 'fourth' then correct_days_array[3]
    when 'fifth' then correct_days_array[4]
    when 'last' then correct_days_array.last
    when 'teenth' then correct_days_array.find { |d| (13..19).include?(d) }
    else
      raise ArgumentError, "Invalid descriptor: #{current_descriptor}"
    end

    Date.civil(year, month, new_day)
  end
end 