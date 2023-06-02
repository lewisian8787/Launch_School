def method(pos_int, boolean)
  if boolean == true
    return pos_int / 2
  else
    return 0
  end
end

def ternary_method(pos_int, boolean)
  boolean ? (pos_int / 2) : 0
end

puts method(4200, true)
puts ternary_method(4200, true)