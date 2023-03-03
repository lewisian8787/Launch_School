hash1 = { names: ["Ian", "Olivia", "Ralph"],
            ages: [35, 31, 5] 
}

def print_keys(hash1)
    hash1.keys.each do | key |
        puts key
    end
end

def print_values(hash1)
    hash1.values.each do | values |
        puts values
    end
end

def print_values_and_keys(hash1)
    hash1.each do |key, value|
      puts "#{key}: #{value}"
    end
end
  

#print_values(hash1)
#print_keys(hash1)
puts print_values_and_keys(hash1)

#Simplified version

opposites = {positive: "negative", up: "down", right: "left"}

opposites.each_key { |key| puts key }
opposites.each_value { |value| puts value }
opposites.each { |key, value| puts "The opposite of #{key} is #{value}" }
