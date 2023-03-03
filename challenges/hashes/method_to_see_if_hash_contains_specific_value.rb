my_hash = { "key1" => "value1", "key2" => "value2", "key3" => "value3" }

if my_hash.value?("value2")
  puts "The hash contains 'value2'."
else
  puts "The hash does not contain 'value2'."
end
