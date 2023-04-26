numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# I would expect it to print the array 1, 2, 2, 3 on four seperate lines as even though .uniq should 
# remove the 2, it was not reassigned to the variable. The puts call prints on seperate lines. 

advice = "Few things in life are as important as house training your pet dinosaur."

puts advice

# replace the word important with urgent

array = advice.split

array = array.map { |x| x == 'important' ? 'urgent' : x }

new_advice = array.join(" ")

puts new_advice

# EASIER WAY

string = "Few things in life are as important as house training your pet dinosaur."

string = string.gsub("important", "urgent")

puts string
