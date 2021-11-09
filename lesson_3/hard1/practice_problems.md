# Practice Problems: Hard 1

### Question 1

``` ruby
if false
  greeting = "hello world"
end

greeting # => nil | in ruby every local variable is initialized to nil
```

### Question 2

``` ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings          #  => {:a=>"hi there"}

=begin

1- greetings pointing to the object { a: 'hi' }
2- informal_greeting is pointing to 'hi'
3- after the method call #<< informal_greeting is pointing to 'hi there'
  #<< is a destructive method that returns self
  so we changed the value of the object that greetings points to
4- greetings now points to {:a=>"hi there"}

=> if we didn't want to modify the original object we could use other methods that doesn't mutate the caller like #+ method

=end
```

### Question 3

**A**
``` ruby
def mess_with_vars(one, two, three)
  # one points to the string object "one"                                              one => "one"
  one = two
  # one now points to the variabel two that contains the string object "two"           one => "two"


  # two points to the string object "two"                                              two => "two"
  two = three
  # two now points to the variabel three that contains the string object "three"       two => "three"


  # three points to the string object "three"                                          three => "three"
  three = one
  # three now points to the variabel one that contains the string object "two"         three => "two"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three) # => "two"

puts "one is: #{one}" # => "one is: one"
puts "two is: #{two}" # => "two is: two"
puts "three is: #{three}" # => "three is: three"
```
**B**
``` ruby
def mess_with_vars(one, two, three)
  # the variable one points to the string object "one"      one => "one"
  one = "two"
  # the variable one points to the string object "two"      one => "two"


  # the variable two points to the string object "two"      two => "two"
  two = "three"
  # the variable two points to the string object "three"    two => "three"


  # the variable three points to the string object "three"  three => "three"
  three = "one"
  # the variable three points to the string object "one"    three => "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three) # => "one"

puts "one is: #{one}" # => "one is: one"
puts "two is: #{two}" # => "two is: two"
puts "three is: #{three}" # => "three is: three"
```
**C**
``` ruby
def mess_with_vars(one, two, three)
  # the variable one points to the string object "one"        one => "one"
  one.gsub!("one","two")
  # the variable one points to the string object "two"        one => "two"


  # the variable two points to the string object "two"        two => "two"
  two.gsub!("two","three")
  # the variable two points to the string object "three"      two => "three"


  # the variable three points to the string object "three"    three => "three"
  three.gsub!("three","one")
  # the variable three points to the string object "one"      three => "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three) # => "one"

puts "one is: #{one}" # => "one is: two"
puts "two is: #{two}" # => "two is: three"
puts "three is: #{three}" # => "three is: one"

# this happens because we used String#gsub! method that mutate the caller and returns self
```

### Question 4

``` ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4 # check if it is a valid IP adrr

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word) # return false if it's not an ip number
  end

  true
end
```