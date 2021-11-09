def shortened_by_three(array)
  array.each_with_index do |name, index|
    array[index] = name[0..2]
  end

  array
end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
shortened_by_three(flintstones)
p flintstones