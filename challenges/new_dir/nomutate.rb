a = [1, 2, 3]

# Example of a method definition that does NOT mutate the argument
def no_mutate(array)
    array.last
end

p "Before no_mutate array: #{a}"
no_mutate(a)
p "After no_mutate array: #{a}"
