# Practice Problems: Medium 1

### Question 1

``` ruby
10.times {|line| Kernel.puts (" " * line) + "The Flintstones Rock!"}
=begin
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
   The Flintstones Rock!
    The Flintstones Rock!
     The Flintstones Rock!
      The Flintstones Rock!
       The Flintstones Rock!
        The Flintstones Rock!
         The Flintstones Rock!
=end
```

### Question 2

``` ruby
puts "the value of 40 + 2 is " + (40 + 2)
# There's two ways to fix this error "no implicit conversion of Integer into String"

# 1- call to_s
puts "the value of 40 + 2 is " + (40 + 2).to_s # => the value of 40 + 2 is 42
# to_s method convert the result of (40 + 2) into a string

# 2- string interpolation
puts "the value of 40 + 2 is #{(40 + 2)}" # => the value of 40 + 2 is 42
```

### Question 3

``` ruby
def factors(number)
  divisor = number
  factors = []
  if divisor <= 0
    puts "Error"
  else
    while divisor > 0 do
      factors << number / divisor if number % divisor == 0
      divisor -= 1
    end
  end
  factors
end
```
> the `number % divisor == 0` check if the _number_ is devided by the _divisor_

> last `line-49` is the implicit return statement of the method

### Question 4

``` ruby
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
```
**Take your pick. Do you like `<<` or `+` for modifying the buffer?**

There's a difference between the `<<` && `+` methods
> the first one **mutate** the caller while the second one **create** a new_object with the same type.

### Question 5

``` ruby
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```
The problem here is that he didn't pass the `limit` variable as an argument for the method while he's using it.
Well the issue here is about variable scope **A variable's scope determines where in a program a variable is available for use.** we can't use an outer variable inside a method without pass in it into the method.

### Question 6

``` ruby
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer) # => 50

p answer - 8 # => 34

# What's happens here?
=begin
Well we intialized the variable answer with the integer 42.
Then we called the method mess_with_it and we pass answer as anrgument. 
  Inside the method we have the variable  some_number == answer.
  Then we call the Integer#+ method which performs addition between the 42 and 8
  Also Integer#+ return a new integer object 50
We pass the result of the method to the variable new_answer
The last line will output the result of the subtraction between 42 and 8 # => 34
=end
```
**As conclusion**
> Integers are implemented as immediates, which means that each Integer is a single `immutable` object which is always passed by value

### Question 7

``` ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

=begin
Well the fimily's data is gone while Spot did too.
Here he's using the Hash#[]= method which associates the given value with the given key; returns value. If the given key exists, replaces its value with the given value.
=end
```

### Question 8

``` ruby
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

# What is the result of the following call?
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock") # => "paper"

=begin
the result of that call is determined by the result of 
1) rps(rps("rock", "paper"), rps("rock", "scissors")) versus 2) "rock"

the result of 1) is determined by 3) rps("rock", "paper") versus 4) rps("rock", "scissors")

the resutl of 3) => "paper"
the resutl of 4) => "rock"
the result of 1) => "paper"
the result of 2) => "rock"

Well the result of that call => "paper" which is 1) versus 2)
```

### Question 9

``` ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo) # => "no"

=begin

Well first of all we call the method bar and we pass in it the method call foo as param.
foo is called with a default param == "no". and Returned the string object "yes".
the we pass the return value of foo into bar which is param == "yes"
inside the bar method we have a ternary operator which is evaluated to return the string object "no"
because "yes" == "no" will be false.

=end
```
