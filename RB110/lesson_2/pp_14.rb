# Given this data structure write some code to return an array containing the colors of the fruits, and the sizes of the vegetables. 
# The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# The return value should look like this:

[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

#Input: A collection of nested hashes
#Output: An array 
#Rules: Array must contain colors of the fruits in sub arrays, capitalized. 
# Array must also contain sizes of fruits, capitalized.
#Test Cases: [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"] == true
#Algorithm:
#Initialize a new local varaible and assign to the return value of calling map on hsh, with two block parameters, _ and value.
#Utilize an if conditional specifying if the value at the value block parameter with the element reference of the symbol type is equal to the string fruit execute;
  #Call the map method on the element at the colors symbol of the value parameter and assing one block parameter, color.
    #Call the capitalize method on that color block parameter. 
#Utilize an elsif conditional specifying if the value at value block parameter with the reference of the symbol 'type' is equal to the string vegetable, execute;
  #Invoke the upcase method on the element return by referencing the 'size' symbol of the 'value' block parameter. 
  #End the conditional statement
#End the map invocation. 

result = hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
    end
end

p result