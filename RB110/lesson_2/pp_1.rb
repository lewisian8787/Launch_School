# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

cat = arr.sort do |a, b|
  b.to_i <=> a.to_i
end

p cat == ['11', '10', '9', '8', '7']

#Input: An array of strings
#Output: New array of strings
#Rules: Must be a new object (array). Must contain strings. Must be in descending numeric value.
#Test Cases: == ['11', '10', '9', '8', '7'] => true
#Algorithm:
#invoke the sort method on the arr array. 
  #Pass a block, designating two block parameters, a and b
    #within the block, invoke the to_i method on b, then the to_i method on a, seperated by the spaceship operator
  #end the block
  
