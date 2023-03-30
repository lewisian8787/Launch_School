def prompt(message)
  puts "=> #{message}"
end

def valid_loan_length?(num) # helper method to validate loan length
  num.to_i.to_s == num
end

def valid_loan_amount?(num) # verify number and loan amount
  num.to_i.to_s == num && num.to_f >= 0 && num.to_f <= 100000
end

def valid_apr?(num)
  num = num.gsub('%', '').strip # remove % sign and leading/trailing spaces
  return false unless num.match?(/^\d+(\.\d+)?$/) # check for valid float format
  num.to_f >= 0 && num.to_f <= 100 # check for valid APR range
end

def total_interest(monthly_payment, loan_length, loan_amount)
  ((monthly_payment * loan_length) - loan_amount).round(2)
end

prompt("Welcome to the Mortgage Calculator!" \
       " This calculator will help you calculate your potential repayments" \
       " before making any big decisions." \
       " To begin, please enter your name:")

name = ''
loop do
  name = gets.chomp

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hello #{name}. Thank you for choosing Mortgage Calcultor.")

loop do # outer loop
  loan_amount = nil
  loop do # inner loop for loan amount
    prompt("What amount would you like to borrow? ($)")
    loan_amount = gets.chomp.gsub(',', '').gsub('$', '')

    if valid_loan_amount?(loan_amount)
      break
    else
      prompt("Hmm.... that amount is not valid. Please try again." \
      " You can enter any amount between $1 and  $100,000.")
    end
  end

  loan_length = nil
  loop do # inner loop for loan length
    prompt("Over how long would you like to borrow? (In months)")
    loan_length = gets.chomp

    if valid_loan_length?(loan_length)
      break
    else
      prompt("Hmm.... that amount is not valid. Please try again. " \
             "Remember to enter in months, so 4 years would be entered as 48")
    end
  end

  apr = nil
  loop do # inner loop for APR rate
    prompt("What rate of APR would you like?")
    prompt("Example: For 10% type 10 or for 6.5% type 6.5")
    apr = gets.chomp

    if valid_apr?(apr)
      break
    else
      prompt("Hmm.... that rate is not valid. Please try again. " \
             "You can enter any amount from 0 to 100.")
    end
  end

  # original Launch School code m = p * (j / (1 - (1 + j)**(-n)))
  monthly_interest_rate = (apr.to_f / 100) / 12 # convert to a float
  monthly_payment = loan_amount.to_f * (monthly_interest_rate /
  (1 - (1 + monthly_interest_rate)**(-loan_length.to_i)))
  rounded_monthly_payment = monthly_payment.round(2)

  prompt("With those terms your monthly repayments would be" \
         " $#{rounded_monthly_payment} over a term of #{loan_length} months.")

  prompt("The total amount of interest you would pay would be $" \
      "#{total_interest(monthly_payment, loan_length.to_i, loan_amount.to_f)}")

  prompt("Would you like to perform another calculation? (Y/N)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Are you finished using Mortgage Calculator? (Y/N)")
answer = gets.chomp
unless answer.downcase.start_with?('y')
  prompt("Thank you for using the Mortgage Calculator. Goodbye!")
end
