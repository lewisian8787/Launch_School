numbers = [1, 2, 3, 4, 5, 6, 7]

new_numbers = numbers.map do | num |
  num + 2
end

p numbers
p new_numbers