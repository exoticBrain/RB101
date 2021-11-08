require 'yaml'
MESSAGES = YAML.load_file('car_loan.yml')

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(key)
  msg = messages(key)
  Kernel.puts("\n==> #{msg}")
end

def load
  38.times do
    Kernel.print("#")
    sleep(0.03)
  end
end

def take_input
  Kernel.print("\n>> ")
  Kernel.gets().chomp()
end

def prompt_error(key)
  msg = messages(key)
  Kernel.puts("\n(!^!)> #{msg}")
end

Kernel.system("clear")
Kernel.puts(messages('welcome'))
prompt('name')
load()
name = take_input()

prompt('data')

loan_amount = take_input().to_i
interest_rate = take_input().to_f
loan_duration = take_input().to_i

annual_percentage_rate = interest_rate.to_f() / 100
monthly_interest_rate = annual_percentage_rate / 12
loan_duration_in_months = loan_duration * 12

monthly_payment = loan_amount * ((monthly_interest_rate) / (1 - (1 + monthly_interest_rate)**(-loan_duration_in_months)))

prompt('end')
load()

Kernel.puts("\nYour monthly payment is: $#{format('%.2f', monthly_payment)}")

