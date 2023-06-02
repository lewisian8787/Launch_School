x = "hi there"
my_hash = {ian: 36, olivia: 23, nick: 34}

new_hash = my_hash.map do |k, v|
  [k.upcase]
end

puts my_hash
puts new_hash