# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. 
# Print out all numbers from the starting number to the ending number, except if a number is divisible by 3, print 
# "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

=begin
input - two integers
output - a string containing integers and strings
algorithm
define a method that takes two args, both exp to be integers
  create a range starting at the first integer and ending at last
    iterate over the Range
      open conditional statement
        puts the iteration if not divisible by 3 or 5
        puts string fizz if iteration is divisible by 3
        puts string buzz if iteration is divisible by 5
      end conditional
    end the iteration
end the method
=end

def fizzbuzz(int1, int2)
  array = []
  (int1..int2).each do |num|
    if num % 3 > 0 && num % 5 > 0
      array << num
    elsif num % 5 == 0 && num % 3 == 0
      array << "FizzBuzz"
    elsif num % 3 == 0
      array << "Fizz"
    elsif num % 5 == 0
      array << "Buzz"
    end
  end
  array.join(', ')
end

 p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
