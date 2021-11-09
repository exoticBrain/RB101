require 'pry-byebug'

def is_palindrome(string)
  # return string == string.reverse
  i = 0
  cp = 0
  j = string.size - 1

  loop do
    if string[i] == string[j]
      cp += 1
    end
    i += 1
    j -= 1
    if i >= string.size
      break
    end
  end

  cp == string.size
end

def calculate_space_word(string)
  i = 0
  space_word = []

  loop do
    if string[i] == ' '
      space_word << i
    elsif i >= string.size
      space_word << string.size
      break
    end
    i += 1
  end

  space_word
end

def upcase_word_if_palindrome(string, space_word)
  j = 0
  size_last_word = 0

  loop do
    current_str = string[size_last_word..(space_word[j] - 1)]
    if is_palindrome(current_str)
      string[size_last_word..(space_word[j] - 1)] = string[size_last_word..(space_word[j] - 1)].upcase
    end
    size_last_word = (space_word[j] + 1)
    j += 1
    if j >= space_word.size
      break
    end
  end

  string
end

def change_me(str)
  return str if str.empty?
  space_word = calculate_space_word(str)
  upcase_word_if_palindrome(str, space_word)
end

p change_me("We will meet at noon") == "We will meet at NOON"
p change_me("No palindromes here") == "No palindromes here"
p change_me("") == ""
p change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"