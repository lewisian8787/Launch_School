# Consider this nested Hash:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
#Determine the total age of just the male members of the family.

#Input a nested, two-level hash
#Output an integer totaling just the male family members
#Test Cases None
#Rules Output must be the total of adding three value, 32, 402 and 10. It must be an integer
#Algorithm 
#initialize a local variable, total_male_age
#iterate over the munsters hash using one block parameter
#utilize addition reassignment to add and reassign the block parameter on each iteration, specifying the age with element reference
  #tag on an if conditional that the gender must be equal to male
  #end
#end

total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

p total_male_age