hash = {names: ["Ian", "Olivia", "Nick", "Katy"], ages: [5, 31, 32, 32]}
h = {a:1, b:2, c:3, d:4}
h[:e] = 5
puts h 

h.delete_if { |key, value| value < 3.5 }
puts h 
