def negative(int)
  if int > 0
    return int - int - int
  else
    return int
  end
end


def negative(number)
  number > 0 ? -number : number
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0  