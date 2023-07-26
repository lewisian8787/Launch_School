# How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

#Input: An array of hashes
#Output: The same array, ordered by rules criteria
#Rules: Array must either be the same object, or a new object in the same strucutre. Must include all current detail. Must be ordered by year of publication, earliest first. 
#Test Cases: books = [
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
# ] == true
#Algorithm: 
#Invoke the sort_by method on the books array.
  #Declare a block with one parameter, hash.
  #The return value of the block should be a reference to the published symbol, within the hash parameter. 
#End the sort_by method. 

sorted_books_by_date = books.sort_by do |hash|
  hash[:published]
end

p sorted_books_by_date

# We can use sort_by and access a particular value in each hash by which to sort, as long as those values have a <=> method.

# In this case, all the values for :published are strings so we know that we can compare them. Since all the values in question are four characters in length, 
# in this case we can simply compare the strings without having to convert them to integers.