num = "77"
friends = {1 => "Bill", 5 => "Bob", 3 => "Jake", 4 => "Aaron"}

friends.each do |num, name|
  puts "#{name} wants a secret number"
  if name == "Bob"
    puts "'Ok', says Joey. Here is the secret number:"
    puts "#{num}"
  else
    puts "No way!"
  end
end
