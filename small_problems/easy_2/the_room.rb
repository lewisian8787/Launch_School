# Build a program that asks a user for the length and width of a room 
# in meters and then displays the area of the room in both square meters 
# and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Test Case

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

def user_entry_length
  puts "Please enter the length of the room (in meters)."
  user_length = gets.chomp
  user_length.to_i
end

def user_entry_width
  puts "Please enter the width of the room (in meters)."
  user_width = gets.chomp
  user_width.to_i
end

def calculate_area(width, length)
  room_area = width * length 
  room_area.to_f
end

def convert_meters_to_feet(num)
  num_in_feet = num * 3.28084
  num_in_feet
end


room_in_meters = calculate_area(user_entry_length, user_entry_width)
room_in_feet = convert_meters_to_feet(room_in_meters)


puts "The area of the room is #{room_in_meters} square meters (#{room_in_feet} square feet)."
