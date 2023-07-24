# One of the most frequently used real-world string properties is that of "string substitution", 
# where we take a hard-coded string and modify it with various parameters from our program.

# Given this previously seen family hash, print out the name, age and gender of each family member:

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# ...like this:

# (Name) is a (age)-year-old (male or female).

#input a nested hash
#output interpolated string
#test cases Herman is a 32-year-old male. == true
#rules
#algorithm
#iterate over the hash using each_pair
  #utilize string interpolation methods to print the string
  #include element references to the correct points in the hash
  #end

  munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }
  
  munsters.each_pair do |key, value|
    puts "#{key} is a #{value['age']}-year-old #{value['gender']}"
  end 
  