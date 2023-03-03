array = [2, 3, 4, 5, 6, 7, 8, 9, 10]

#array.each { |num| puts num if num > 5 }

#array2 = array.select { |num| num.odd? }

array << 11
array.unshift(1)
array.pop
array << 3
new_array = array.uniq
#puts array
puts new_array