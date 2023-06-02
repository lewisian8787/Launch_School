def print_in_box(string)
  puts "+---------------------------------------+"
  puts "|                                       |"
  puts "|" + string.center(39) + "|"
  puts "|                                       |"
  puts "+---------------------------------------+"
end

print_in_box("I am a cat.")