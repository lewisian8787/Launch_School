# Count letters in string
# In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key
# and count as 'value'. The key must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.
# Example:
# letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

=begin
Problem
Input: A string
Return: A hash with symbol keys for each letter and a count of letter occurences
Rules
Symbols not strings as the keys in the hash. 
Input will always be a string
No empty input. 
All lowercase input. 

Examples

Data 
String
Hash
Symbols
Hash

Algorithm
High-Level:
Iterate over the argument string. 
Increment a hash with the count of letters using symbols as the keys
Return hash

Step-by-Step
- Define a method that takes a single string argument. 
- Initialize an empty hash with default values set to 0. 
- Iterate over each char of the arg. string.
  - Assing hash key to 

=end

def letter_count(string)

  count_hash = Hash.new(0)

  string.each_char do |char|
    count_hash[char.to_sym] += 1
  end

  p count_hash
end


p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}