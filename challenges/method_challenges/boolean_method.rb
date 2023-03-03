daylight = [true, false].sample

def time_of_day(poop) #you can name the parameter whatever you like. 
    if poop == true        #as long as it has the same name here.
        puts "It is daytime"
    else
        puts "It is nighttime"
    end
end

puts daylight
time_of_day(daylight)