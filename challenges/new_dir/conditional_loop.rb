i = 0 
loop do
    i = i + 2
    if i == 4
        next           #Skip the rest of the code in the iteration
    end
    puts i
    if i == 10
        break
    end
end
