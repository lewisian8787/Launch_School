alphabet = 'abcdefghijklmnopqrstuvwxyz'

alphabet.each_char do
    |character|
    puts character
end

#below method does the same thing

puts alphabet.split('')