def double_odd_numbers(numbers, multiply_number)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= multiply_number
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_numbers(my_numbers, 4)