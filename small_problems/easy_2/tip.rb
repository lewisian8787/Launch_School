# Create a simple tip calculator. The program should prompt for a bill 
# amount and a tip rate. The program must compute the tip and then 
# display both the tip and the total amount of the bill.

# Test Case
# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

def tip(amount, per)
  tip_amount = (amount * (per.to_f / 100))
  tip_amount
end

def total_amount(tip_am, total)
  grand_total = (tip_am + total)
  grand_total
end

puts "What is the bill total?"
bill_total = gets.chomp.to_i

puts "What is the tip percentage?"
percentage = gets.chomp.to_i

puts "The tip is $#{tip(bill_total, percentage)}"

puts "The total is $#{total_amount(tip(bill_total, percentage), bill_total)}"