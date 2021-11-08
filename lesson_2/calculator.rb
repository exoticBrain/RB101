require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang)
  MESSAGES[lang][message]
end

def prompt(key)
  msg = messages(key, LANGUAGE)
  Kernel.puts("\n==> #{msg}")
end

def load
  30.times do
    Kernel.print("#")
    sleep(0.03)
  end
end

def take_input
  Kernel.print("\n>> ")
  Kernel.gets().chomp()
end

def prompt_error(key)
  msg = messages(key, LANGUAGE)
  Kernel.puts("\n(!^!)> #{msg}")
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def valid_operator?(opt)
  %w(+ * - /).include?(opt)
end

def make_the_calc(opt, num1, num2)
  case opt
  when "+"
    prompt("#{num1} + #{num2} = #{num1.to_i + num2.to_i}")
  when "-"
    prompt("#{num1} - #{num2} = #{num1.to_i - num2.to_i}")
  when "*"
    prompt("#{num1} * #{num2} = #{num1.to_i * num2.to_i}")
  when "/"
    if num2 == "0"
      prompt_error('zero')
      num2 = enter_number()
      make_the_calc("/", num1, num2)
    else
      prompt("#{num1} / #{num2} = #{num1.to_f / num2.to_i}")
    end
  end
end

def enter_number(num)
  number = ''
  loop do
    prompt('enter_number')
    number = take_input()
    if valid_number?(number)
      break
    else
      prompt_error('valid_number')
    end
  end
  number
end

Kernel.puts("Which language you speak type 'En' for English or 'Fr' for French")
LANGUAGE = take_input().downcase

prompt('welcome')
name = take_input()
prompt('start')
load()
loop do
  system("clear")
  number1 = enter_number(1)
  number2 = enter_number(2)

  operator_type = prompt('operator_type')
  answer = ''
  loop do
    answer = take_input()
    if valid_operator?(answer)
      break
    else
      prompt_error('valid_operator')
    end
  end

  load()
  make_the_calc(answer, number1, number2)
  prompt('retry')
  recalculat = take_input()
  break unless recalculat.downcase == "y"
end
prompt('end')
load()
system("clear")
