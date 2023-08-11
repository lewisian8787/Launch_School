# Write a method that will take a short line of text, and print it 
# within a box.

# input a string (sentence)
# output a box containing the unchanged string
# test cases 
# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
# rules must be the same string. must fit in the terminal window. must
# be contained within a box of sorts. 
# algorithym 
# 

def print_in_box(str)
  string_length = str.length
  box_length = (string_length + 2)
    print '+'
  box_length.times do
    print '-'
  end
    puts '+'
    print '|'
  box_length.times do
    print ' '
  end
    puts '|'
    puts "| #{str} |"
    print '|'
  box_length.times do
    print ' '
  end
    puts '|'
    print '+'
  box_length.times do
    print '-'
  end
    puts '+'
end

print_in_box('twat')

# puts "| #{str} |"