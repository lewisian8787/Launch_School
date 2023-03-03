numbers = [5, 9, 21, 26, 39]
divide_by_three = numbers.select { |n| n % 3 == 0 }
p divide_by_three

