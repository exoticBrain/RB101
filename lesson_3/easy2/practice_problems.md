# Practice Problems: Easy 2

### Question 1

``` ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# see if "Spot" is present in this hash of people and their age.

ages.has_key?("Spot") # => false
ages.key?("Spot")     # => false
ages.member?("Spot")  # => false
ages.include?("Spot") # => false
```
_Methods has_key?, key?, and member? are aliases for #include?_
> Returns true if key is a key in self, otherwise false.

### Question 2

``` ruby
munsters_description = "The Munsters are creepy in a good way."

munsters_description.swapcase!   # => "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.capitalize! # => "The munsters are creepy in a good way."
munsters_description.downcase!   # => "the munsters are creepy in a good way."
munsters_description.upcase!     # => "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
```

### Question 3

``` ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# add ages for Marilyn and Spot to the existing hash
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages) # => {"Herman"=>32, "Lily"=>30, "Grandpa"=>5843, "Eddie"=>10, "Marilyn"=>22, "Spot"=>237}
```
__`Hash#merge!` method merges each of other_hashes into self; returns self. Each argument in other_hashes must be a Hash__

### Question 4

``` ruby
advice = "Few things in life are as important as house training your pet dinosaur."
# See if the name "Dino" appears in the string advice
advice.include?("Dino") # => false
```
> `String#include?` method returns true if str contains the given string or character.

### Question 5

``` ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
# we can write this array usin %w
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones # => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
```
**What does `%w` in Ruby do?**
> it's a notation to write an `array of strings` separated by spaces instead of commas and without quotes around them.

### Question 6 && Question 7

``` ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# add the family pet "Dino" to our usual array
flintstones << "Dino" # => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles", "Dino"]

flintstones.push("Hoppy").push("some_string")
# flintstones.push("Exotic")
# flintstones.append("Brain")
# flintstones.concat(*other_arrays)

# those four Array(#<<, #push, #append and #concat) methods appends each argument in objects to self; returns sel
```

### Question 8

``` ruby
advice = "Few things in life are as important as house training your pet dinosaur."

postion_of_partition = advice.index("house")
advice.slice!(advice[postion_of_partition..-1]) # => "house training your pet dinosaur."

advice # => "Few things in life are as important as "
```

### Question 9

``` ruby
statement = "The Flintstones Rock!"

# Write a one-liner to count the number of lower-case 't' characters in the statement string
statement.count("t") # => 2
```

### Question 10

``` ruby
title = "Flintstone Family Members"
# center that title above the table with spaces
title.center(40) # => "       Flintstone Family Members        "
```
> `String#center` method centers str in width. If width is greater than the length of str, returns a new String of length width with str centered and padded with padstr; otherwise, returns str