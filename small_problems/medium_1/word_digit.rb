# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

=begin
---Problem---
- Input: A sentence string
- Output: The same string 
- Rules: 
  - Implicit: 
      - The spaces remain intact. 
  - Explicit:
      - Return value must be the same string. 
      - Return string must convert numbers from text to numeric.

---Examples---
- "My number is nine one one." => "My number is 9 1 1"

---Data Structure---
- Input: String
- Output: String
- Intermediate: Hash

---Algorithm---
1. Define a method that takes one argument, expected to be a string. 
2. Invoke the split method on the array argument and save the return to a new variable
3. initialize a hash variable and assign to a hash of 1 thorugh 9
4. iterate over array
  4a. if element is in hash, substitue word in string with element key in hash
5. return string
---Code---
=end

# def word_to_digit(string)
#   array = string.split
#   hash = {"one" => 1,
#   "two" => 2, 
#   "three" => 3,
#   "four" => 4,
#   "five" => 5, 
#   "six" => 6,
#   "seven" => 7,
#   "eight" => 8,
#   "nine" => 9,
#   "zero" => 0}

#   array.each do |word|
#     word.delete!(/[^a-zA-Z]/) if 
#     string.gsub!(/\b#{word}\b/, hash[word].to_s) if hash.keys.include?(word)
#   end
#   p string
# end



def word_to_digit(string)
  hash = {"one" => 1,
  "two" => 2, 
  "three" => 3,
  "four" => 4,
  "five" => 5, 
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9,
  "zero" => 0}

  string.gsub!(/\b\w+\b/) do |word|
    if hash.key?(word)
      hash[word].to_s
    else
      word
    end
  end
  p string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'