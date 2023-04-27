included = (10..100).include? 142

puts included

famous_words = "seven years ago..."

famous_words.prepend("Four score and ")

puts famous_words

famous_words2 = "seven years ago..."

famous_words2.insert(0, "Four score and ")

puts famous_words2

famous_words3 = "seven years ago..."

famous_words3 = "Four score and " << famous_words3

puts famous_words3
