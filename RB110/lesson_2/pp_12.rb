# Given the following data structure, and without using the Array#to_h method, write some code that 
# will return a hash where the key is the first item in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

#Input: An array of nested sub-arrays
#Output: A hash
#Rules: Each key in the has must be the first element in each original sub-array. Each value must be the second item
#Test Cases: None
#Algorithm: 
#Each with object method is appearing a good option.
#Intialize a new local variable and assign it to the return value of calling each_with_object on the arr array.
#The object included will be a new hash
#Set three block parameters here, a key, value and the new hash name
#Set the new hash key to be the key block parameter and the value to be the value block parameter. 
#End the method

end_result = arr.each_with_object({}) do |(k, v), new_hash|
  new_hash[k] = v
end

p end_result