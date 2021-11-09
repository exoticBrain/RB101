def expresses_frequency(string)
  statement = {}
  chars = string.chars

  chars.each do |current_char|
    next if current_char == ' '
    statement[current_char] = chars.count {|letter| current_char == letter}
  end

  statement
end

statement = "The Flintstones Rock"

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

p expresses_frequency(statement)