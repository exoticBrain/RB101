hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = %w(a e i o u)
vowels_from_string = []
hsh.each_value do |sub_arr|
  sub_arr.each do |string|
    string.chars.each do |current_char|
      vowels_from_string << current_char if VOWELS.include?(current_char)
    end
    # count = 0
    # while count < string.size
    #   current_char = string[count]
    #   vowels_from_string << current_char if VOWELS.include?(current_char)
    #   count += 1
    # end
  end
end

p vowels_from_string.size