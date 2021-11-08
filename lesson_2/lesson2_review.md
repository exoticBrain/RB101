# Lesson 2 notes

### Truthiness

``` ruby
$irb > true.class   # => TrueClass
$irb > true.nil?    # => false
$irb > true.to_s    # => "true"
$irb > true.methods # => list of methods you can call on the true objects
```
**example**
```ruby
if true # This will always output 'Hi'
  Kernel.puts("Hi")
else
  Kernel.puts("Goodebye")
end
```
###### Logical Opearators

`&&` <=> `AND`
> Returns true if both expressions being evaluated as __true__

`||` <=> `OR`
> Returns true if either one of the evaluated object is __true__

**example**
``` ruby
$irb > true == true && false != nil || false == nil
# => true
```
As conclusion
> Ruby consider everything `is true object` to be truthy other than __false__ and __nil__
> even the number `0` is considered truthy

### Pseudo-Code

`Pseudo-Code` is meant for humans to read, it's not meant for machines to programs to process.

**There're two layers to solving any problem**
  * The `Logical problem` domain layer.
  * The `Syntactical` programming language layer.

###### Key words to assist us with their meaning
Keyword | Meaning
--------|---------
__START__ | Start of the program
__SET__ | Sets a variable we can use for later
__GET__ | Retrieve input from user
__PRINT__ | Display output to user
__READ__ | Retrieve a value from a variable
__IF/ELSEIF/ELSE__ | Show conditional branches in logic
__WHILE__ | Show looping logic
__END__ | End of the program

### Flow Chart

Using a flow chart Helps us mapout the __logical__ sequence of possible
__solution__ in a visual way.

### Debugging

`Debugging` is arguable the most important skill you need to learn as a programmer.

* __Temperament__            : Debugging with feelings of frustration is the first critical aspect of learning to program.
* __Reading error messages__ : One of the first things you'll have to get used to is `learning` how to carefully `read` the error `stack trace`.
* __Techniques for debugging__
  * Line by line
  * Rubber Duck
  * Walking away
  * Using pry

### Coding Tips

* __Naming things__      : choose descriptive variable and methods names.
* __Naming conventions__ :
  * Make sure to use `snake_case` when naming everything exept classes and constant.
  * Classes use `CamelCase`
  * Constant use `UPPERCASE`
* __Methods__            :
  * Your method should be short around 10 lines.
  * The return value shouldn't be the intent of the method.
  * Decide wether the method should return a value with no side effect or perform a side effect with no return value.

### Variable Scope

A variable's scope determines where in a program a variable is available for use.
> In Ruby, variable scope is defined by a `Method definition` or by a `Block`.

**Constant** => are said to have `lexical scope`.
> _method invocation_ <=> _method call_

**Block execution example**
``` ruby
def greetings
  yield
  Kernel.puts("It's Tariq from the block")
end

word = "Hello"

gereetings do
  Kernel.puts(word)
end
```
### Pass by value `vs` Pass by Reference

> Ruby acts like pass by value for `immutable` objects, pass by reference for `mutable` objects.

**Examples**
* Pass by value
  ``` ruby
  def add_last_name(full_name)
    full_name += " Brain"
  end
  name = "Tariq"
  add_last_name(name)
  p name

  ```
* Pass by Reference
  ``` ruby
  def add_last_name(full_name)
    full_name << " Brain"
  end
  name = "Tariq"
  add_last_name(name)
  p name
  ```
Well, `String#<<` is a destructive method. While `String#+` is not a destructive method

**Destructive** <=> **Mutating**

