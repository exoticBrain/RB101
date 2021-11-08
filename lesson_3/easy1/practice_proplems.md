# Practice Problems: Easy 1

### Question 1

``` ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```
the code above will  print.
``` ruby
1
2
3
```

> `Array#uniq` returns a new Array containing those elements from self that are not duplicates.
> while puts print each element in that array with a `new line`.

### Question 2

* what is != and where should you use it?
  * _Returns true if two objects are not-equal, otherwise false_
  `example` 1 != 2 # True

* put ! before something, like !user_name
  * _`Boolean negate` returns true or false_

* put ! after something, like words.uniq!
  * _It's not Ruby `syntax` but used somtimes to refer to a destructiv method_

* put ? before something
  * _`Conditional Expression` Ternary operator_

* put ? after something
  * _It's not Ruby `syntax` but used somtimes to refer to a method that return either `true or false`_

* put !! before something, like !!user_name
  * _Turn any object into their boolean equivalent_
  * **example**
  ``` ruby
  $irb > a = 2021
  $irb > !!a
  => true
  $irb > b = nil
  $irb > !!b
  => false
  ```

### Question 3

Replace the word "important" with "urgent" in this string:
``` ruby
advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!("important", "urgent")

advice # => "Few things in life are as urgent as house training your pet dinosaur."
```
> `String#gsub!` is a desctructive method performs the substitutions of the pattern with the replacement.

> returning str, or nil if no substitutions were performed. If no block and no replacement is given, an enumerator is returned instead.

### Question 4

``` ruby
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)

numbers # => [1,3,4,5] Array#delete_at method deletes an element from self, per the given Integer index


numbers = [1, 2, 3, 4, 5]
numbers.delete(1)

numbers # => [2,3,4,5] Array#delete method that deletes the object given from self

numbers.delete(3)
numbers # => [2,4,5]
```
**Self**  `<=>`  **The calling object**

### Question 5

Programmatically determine if 42 lies between 10 and 100.

``` ruby
$irb > (10..100).cover?(42)
  => true
```
> `Range#cover?` method returns true if obj is between the begin and end of the range.

### Question 6
_different ways to put the expected "Four score and " in front of famous_words_
``` ruby
famous_words = "seven years ago..."

"Four score and " + famous_words
# String#+ method Returns a new String containing other_string concatenated to self

"Four score and " << famous_words
# String#<< method Returns a new String containing the concatenation of self and object

famous_words.prepend("Four score and ")
# String#prepend method Returns a new String containing the concatenation of all given other_strings and self
```

### Question 7

``` ruby
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones # => ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

# to turn this nested array to un-nested array we'll do the following :

flintstones.flatten!
flintstones # => ["Fred", "Wilma", "Barney", "Betty", "BamBam", "Pebbles"]

# Array#flatten! method Replaces each nested Array in self with the elements from that Array; returns self if any changes, nil otherwise.
```

### Question 8

``` ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# Turn this into an array containing only two elements: Barney's name and Barney's number

flintstones.assoc("Barney") # => ["Barney", 2]
# Hash#assoc method returns a 2-element Array containing that key and its value, if the given key is found, nil otherwise.
```
