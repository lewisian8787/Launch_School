words = ['car', 'human', 'elephant', 'airplane']
words.each do |plural|
    puts "#{plural}s"
end

words = 'car human elephant airplane'

words.split(' ').each do |word|
  puts word + 's'
end