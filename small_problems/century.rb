# Write a method that takes a year as input and returns the century. 
# The return value should be a string that begins with the century 
# number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000
# comprise the 20th century.

def century(year)
  century = (year - 1) / 100 + 1
  century = century.to_s


  if century.end_with?("11", "12", "13")
    century << "th"
  elsif century.end_with?("1")
    century << "st"
  elsif century.end_with?("2")
    century << "nd"
  elsif century.end_with?("3")
    century << "rd"
  else
    century << "th"
  end
  
  puts century
end



century(99)
