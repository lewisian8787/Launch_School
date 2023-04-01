require 'yaml'

MESSAGES = YAML.load_file("mortgage_calc_messages.yml")

def prompt(message)
  puts "=> #{message}"
end

def prompt_user_name # helper method to gather user name
  name = ''
  loop do
    name = gets.chomp

    if name.empty?()
      prompt(MESSAGES["name_empty"])
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
    prompt(MESSAGES["loan_amount_question"])    
    print '$'
    loan_amount = gets.chomp.gsub(',', '').gsub('$', '')

    if valid_loan_amount?(loan_amount)
      break
    else
      prompt(MESSAGES["invalid_loan_amount"])
    end
  end
  loan_amount
end

def prompt_loan_length # helper method to collect loan length
  loan_length = nil
  loop do
    prompt(MESSAGES["loan_length_question"])
    loan_length = gets.chomp
    if valid_loan_length?(loan_length)
      break
    else
      prompt(MESSAGES["invalid_loan_length"])
    end
  end
  loan_length
end

def prompt_apr_amount # helper method to collect APR amount
  apr_amount = nil
  loop do
    prompt(MESSAGES["apr_rate_question"])
    prompt(MESSAGES["apr_rate_question_help"])
    apr_amount = gets.chomp.gsub('%', '')
    if valid_apr?(apr_amount)
      break
    else
      prompt(MESSAGES["invalid_apr_rate"])
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

prompt(MESSAGES["name_prompt_message"])
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

  prompt("With a loan of $#{loan_amount}, your monthly repayments would be" \
        " $#{payment} over a term of #{loan_length} months.")

  prompt("The total amount of interest you would pay would be $" \
      "#{total_interest(payment, loan_length.to_i, loan_amount.to_f)}")

  prompt(MESSAGES["try_again"])
  user_retry_response = gets.chomp
  break unless user_retry_response.downcase.start_with?('y')
end

prompt(MESSAGES["goodbye"])

# end of code
