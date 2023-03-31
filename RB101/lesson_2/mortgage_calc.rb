def prompt(message)
  puts "=> #{message}"
end

def prompt_user_name # helper method to gather user name
  name = ''
  loop do
    name = gets.chomp

    if name.empty?()
      prompt("Make sure to use a valid name.")
    else
      break
    end
  end
  name
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

def prompt_loan_amount # helper method to collect loan amount
  loan_amount = nil
  loop do
    prompt("What amount would you like to borrow?")
    print '$'
    loan_amount = gets.chomp.gsub(',', '').gsub('$', '')

    if valid_loan_amount?(loan_amount)
      break
    else
      prompt("Hmm.... that amount is not valid. Please try again." \
      " You can enter any amount between $1 and  $100,000.")
    end
  end
  loan_amount
end

def prompt_loan_length # helper method to collect loan length
  loan_length = nil
  loop do
    prompt("Over how long would you like to borrow? (In months)")
    loan_length = gets.chomp
    if valid_loan_length?(loan_length)
      break
    else
      prompt("Hmm.... that amount is not valid. Please try again. " \
            "Remember to enter in months, so 4 years would be entered as 48")
    end
  end
  loan_length
end

def prompt_apr_amount # helper method to collect APR amount
  apr_amount = nil
  loop do
    prompt("What rate of APR would you like?")
    prompt("Example: For 10% type 10 or for 6.5% type 6.5")
    apr_amount = gets.chomp.gsub('%', '')
    if valid_apr?(apr_amount)
      break
    else
      prompt("Hmm.... that rate is not valid. Please try again. " \
            "You can enter any amount from 0 to 100.")
    end
  end
  apr_amount
end

def calculate_monthly_payment(loan_amount, apr_amount, loan_length)
  monthly_interest_rate = (apr_amount.to_f / 100) / 12 # convert to a float
  monthly_payment = loan_amount.to_f * (monthly_interest_rate /
    (1 - (1 + monthly_interest_rate)**(-loan_length.to_i)))
  monthly_payment.round(2)
end

# main code

prompt("Welcome to Mortgage Calculator!" \
       " This calculator will help you calculate your potential repayments" \
       " before making any big decisions." \
       " To begin, please enter your name:")

name = prompt_user_name()

prompt("Hello #{name}. Thank you for choosing Mortgage Calcultor.")

loop do
  loan_amount = prompt_loan_amount()
  system "clear"
  prompt("You have entered $#{loan_amount}.")

  loan_length = prompt_loan_length()
  system "clear"
  prompt("You have entered $#{loan_amount} over a period" \
         " of #{loan_length} months.")

  apr_amount = prompt_apr_amount()
  system "clear"
  prompt("You have entered $#{loan_amount}, over a period" \
         " of #{loan_length} months," \
        " at a rate of #{apr_amount}% APR.")

  puts ">>> calculating repayments"
  puts ">>> please wait"
  puts ">>> almost there! "
  puts ""

  payment = calculate_monthly_payment(loan_amount, apr_amount, loan_length)

  prompt("Your loan amount would be $#{loan_amount}.")

  prompt("Your monthly repayments would be" \
        " $#{payment} over a term of #{loan_length} months.")

  prompt("The total amount of interest you would pay would be $" \
      "#{total_interest(payment, loan_length.to_i, loan_amount.to_f)}")

  prompt("Would you like to try again? (Y/N)")
  user_retry_response = gets.chomp
  break unless user_retry_response.downcase.start_with?('y')
end

prompt("Thank you for using Mortgage Calculator. " \
       "We hope to see you again soon.")

# end of code
