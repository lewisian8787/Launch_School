qux = [123, ['a'], nil, 'zappa']
foo = ['a', 1, ['a'], {'1': 1}, nil]

common_elements = foo.select do |ele|
  qux.include?(ele) ? ele : false
end

p common_elements