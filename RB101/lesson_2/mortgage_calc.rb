require 'yaml'

MESSAGES = YAML.load_file("mortgage_calc_messages.yml")

# user input methods

def prompt(message)
  puts "=> #{message}"
end

def prompt_user_name
  name = gets.chomp
  while name.match?(/\A\s*\z/)
    prompt(MESSAGES["name_empty"])
    name = gets.chomp
  end
  name
end

def prompt_loan_amount
  loan_amount = nil
  loop do
    prompt(MESSAGES["loan_amount_question"])
    print '$'
    loan_amount = gets.chomp.gsub(',', '').gsub('$', '')
    break if valid_loan_amount?(loan_amount)
    prompt(MESSAGES["invalid_loan_amount"])
  end
  loan_amount
end

def prompt_loan_length
  loan_length = nil
  loop do
    prompt(MESSAGES["loan_length_question"])
    loan_length = gets.chomp
    break if valid_loan_length?(loan_length)
    prompt(MESSAGES["invalid_loan_length"])
  end
  loan_length.to_f
end

def prompt_apr_amount
  apr_amount = nil
  loop do
    prompt(MESSAGES["apr_rate_question"])
    prompt(MESSAGES["apr_rate_question_help"])
    apr_amount = gets.chomp.gsub('%', '')
    break if valid_apr?(apr_amount)
    prompt(MESSAGES["invalid_apr_rate"])
  end
  apr_amount
end

# message user methods

def welcome_message(name)
  prompt("Hello #{name}. Thank you for choosing Mortgage Calcultor.")
end

def confirm_loan_amount(loan_amount)
  system "clear"
  prompt("You have entered $#{loan_amount}.")
end

def confirm_loan_length(loan_length, loan_amount)
  system "clear"
  prompt("You have entered $#{loan_amount} over a period" \
  " of #{loan_length} years.")
end

def confirm_apr_amount(apr_amount, loan_length, loan_amount)
  system "clear"
  prompt("You have entered $#{loan_amount}, over a period" \
         " of #{loan_length} years," \
        " at a rate of #{apr_amount}% APR.")
end

def confirm_repayments(loan_amount, apr_amount, loan_length, payment)
  prompt("For a loan of $#{loan_amount}, at #{apr_amount}% APR," \
         " over a term of #{loan_length} years, your monthly repayments " \
         "would be $#{payment}.")
end

# boolean methods

def valid_loan_length?(num)
  if num.to_f < 1 || num.to_f > 35
    false
  else
    true
  end
end

def valid_loan_amount?(num)
  num.to_i.to_s == num && num.to_f >= 100 && num.to_f <= 100000
end

def valid_apr?(num)
  num = num.gsub('%', '').strip
  return false unless num.match?(/^\d+(\.\d+)?$/)
  num.to_f >= 0 && num.to_f <= 100
end

def should_try_again?
  prompt(MESSAGES["try_again"])
  user_retry_response = gets.chomp
  user_retry_response.downcase.start_with?('y')
end

# mathmatical methods

def total_interest(monthly_payment, loan_length, loan_amount)
  ((monthly_payment * loan_length) - loan_amount).round(2)
end

def calculate_monthly_payment(loan_amount, apr_amount, loan_length)
  loan_amount = loan_amount.to_f
  apr_amount = apr_amount.to_f
  monthly_interest_rate = apr_amount / (12 * 100)

  if apr_amount == 0
    zero_apr_monthly_payment = loan_amount / (loan_length * 12)
    zero_apr_monthly_payment.round(2)
  else
    monthly_payment = loan_amount * (monthly_interest_rate /
      (1 - (1 + monthly_interest_rate)**(-loan_length * 12)))
    monthly_payment.round(2)
  end
end

# misscelaneous

def calculation_loading_message
  <<~HEREDOC
    >>> Calculating repayments!
    >>> Please wait!
    >>> Almost there!
    >>> ......
  
  HEREDOC
end

# main code

prompt(MESSAGES["name_prompt_message"])
name = prompt_user_name()
welcome_message(name)

loop do
  loan_amount = prompt_loan_amount()
  confirm_loan_amount(loan_amount)

  loan_length = prompt_loan_length()
  confirm_loan_length(loan_length, loan_amount)

  apr_amount = prompt_apr_amount()
  confirm_apr_amount(apr_amount, loan_length, loan_amount)

  puts calculation_loading_message()

  payment = calculate_monthly_payment(loan_amount, apr_amount, loan_length)

  confirm_repayments(loan_amount, apr_amount, loan_length, payment)

  break unless should_try_again?
end

prompt(MESSAGES["goodbye"])

# end of code
