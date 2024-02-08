text = File.read('example.txt')

text = text.split('.')
text = text.map do |sent|
  sent.split
end

final_sentence = text.max_by { |sentence| sentence.length }

puts final_sentence.join(' ')
p final_sentence.size
