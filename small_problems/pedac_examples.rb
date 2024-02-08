require 'pry'
# An array of integers is a SPIRAL if the integers increase to a single max
# value, and then decrease down from there. Write a method that returns
# true if an array is a spiral, else return false.

=begin
---Problem---
- Input: array of integers
- Output: boolean indicating whether the integrs are a spiral
- Rules
  - Explicit
    - All elements will be integrs
    - A spiral is where the integers increase to a max, then decrease
  - Implicit
    - It's only a spiral if there's a single maximum (not duplicated)
    - The increase / decrease can be more than 1
    - Assume there's no duplicates outside of the maximum
- Mental model: for each number in the array, if it's below the maximum check that it's larger than the number before, otherwise it check if it's lower. If this is true for all elements, it is a spiral

---Examples---
p spiral([1, 2, 4, 3, 2, 1]) #== true
# p spiral([1, 2, 4, 6, 4, 2, 1]) == true
# p spiral([0, 3, 5, 4, 3, 2, 1]) == true
# p spiral([0, 3, 5, 5, 4, 3, 2, 1]) == false
# p spiral([1, 2, 4, 6, 4, 2, 4]) == false
# p spiral([1, 5, 4, 6, 4, 2, 1]) == false

---Data structures---
- Input: array
- Output: boolean
- Intermediate

--Algorithm---
1. Create a variable 'max' to store the maximum value in the array (use #max)
2. For each num and index in `input_arr`
  1. Next if index is 0
  2. If num's index is less than the index of the max value
    1. Return false if num is less than the number before
  3. Else if num's index is greater than the index of the max value
    1. Return false if num is greater than the num before
3. Return true

=end

def spiral(input_arr)
  max = input_arr.max

  input_arr.each_with_index do |num, index|
    next if index == 0

    if index < input_arr.index(max)
      return false if num <= input_arr[index - 1]
    elsif index > input_arr.index(max)
      return false if num >= input_arr[index - 1]
    end
  end

  true
end

p spiral([1, 2, 4, 3, 2, 1]) == true
p spiral([1, 2, 4, 6, 4, 2, 1]) == true
p spiral([0, 3, 5, 4, 3, 2, 1]) == true
p spiral([0, 3, 5, 5, 4, 3, 2, 1]) == false
p spiral([1, 2, 4, 6, 4, 2, 4]) == false
p spiral([1, 5, 4, 6, 4, 2, 1]) == false

_____________________________________________________

# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

=begin
---Problem---
- Input: a string
- Output: a single character string representing the character occurs least often
- Rules
  - Explicit
    - If there multiple chracters that occur least often, return the one that appears first
    - Case insensitive
  - Implicit
    - Return value should be lower case regardless of the case that appears in the string
    - The string may include spaces and punctuation, and these should be included in the count
    - If the string only contains one character, return that character
- Mental model: for each character that appears in the string, check how many times it appears. Return the one that appears least, or the first if multiple appear least.

---Examples---
p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

--Data Structure---
- Input: string
- Output: a string
- Intermediate: an array of characters, a hash to count the number of times each occurs

--Algorithm---
High level:
1. Create a variable downcase_string that references the input string converted to all lower case
2. Create an array `chars` of the unique characters in the string, case insensitive
3. Create an empty hash `counts`to store the count of each character
4. For each char in `chars`
  1. Count the number of times it appears in 'downcase_string'
  2. Add a new key-value pair in the hash with `char` as key and the count as value
5. Sort the hash by the values (in ascending order)
6. Return the first key from the hash  


Unique chars:
- 
=end

def least_common_char(input_string)
  downcase_string = input_string.downcase

  chars = unique_chars(input_string)
  counts = {}
  chars.each do |char|
    count = downcase_string.count(char)
    counts[char] = count
  end

  sorted_counts = counts.sort_by { |char, count| count }
  sorted_counts[0][0]
end

def unique_chars(input_string)
  ['h', 'e', 'l', 'o', ' ', 'w', 'r', 'd']
end  

# Examples:

p least_common_char("Hello World") == "h"
# p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
# p least_common_char("Mississippi") #== "m"
# p least_common_char("Happy birthday!") #== ' '
# p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true". 

____________________________________________________________________________

# Have the method letter_changes(str) take the str parameter being passed and modify it using the following algorithm. Replace every letter in the string with the 3rd letter following it in the alphabet (ie. c becomes f, Z becomes C). Then return this modified string.

=begin
---Problem---
Input: String of multiple or single words. 
Return: Same string, modified according to algorithm. 
Explicit:
  - Each letter must be replaced by the letter 3 after it in alphabet. 
  - Must modify passed in argument and return same string.
Implicit:
  - Case remains the same. 
  - Non alphabetic characters remain the same. 
  - Spaces remain the same. 
  - Loops back to a after z. 

---Data Structures---
Array of the alphabet. 

---Algorithm---
- Define a constant that is an array of the alphabet that loops past z to c again. 
- One in uppercase and one in lowercase.
- Define a method exp to take a string argument. 
- Iterate over the string using a transformative method. 
  - If character is included in the lowercase constant
    - Reassign char in string with the character in the constant + 3. 
  - Elfif character is included in uppercase constant. 
    - Reassign char in string with the character in the constant + 3. 
  - Else next. 
- Return the string. 
- End the method. 
=end

LOWERCASE_ALPH = ("a".."z").to_a + ("a".."z").to_a
UPPERCASE_ALPHA = ("A".."Z").to_a + ("A".."Z").to_a

def letter_changes(string)
  string.each_char.with_index do |char, index|
    if LOWERCASE_ALPH.include?(char)
      string[index] = LOWERCASE_ALPH[LOWERCASE_ALPH.index(char) + 3]
    elsif UPPERCASE_ALPHA.include?(char)
    string[index] = UPPERCASE_ALPHA[UPPERCASE_ALPHA.index(char) + 3]
    else next
    end
  end
  string
end

  

p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')