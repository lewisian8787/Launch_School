# iterating_over_hashes.rb

person = {name: 'bob', height: '6 ft', weight: '160 lbs', hair: 'brown'}

person.each do |key, value|
  puts "Bob's #{key} is #{value}"
end
def greeting(name, options= {})
    if options.empty?
        puts "Hi my name is #{name}"
    else 
        puts "Hi, my name is #{name} and I'm #{options[:age]}" + 
            " years old and I live in #{options[:city]}."
    end
end

greeting("Ian")
greeting("Ian", {age: 35, city: "Raleigh"})
