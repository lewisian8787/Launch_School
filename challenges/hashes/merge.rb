hash1 = { City: "Raleigh", State: "North Carolina", Country: "USA" }
hash2 = { Citylive: "New York", Statelive: "California", Countrylive: "England" }

hash3 = hash1.merge!(hash2)

puts hash3
