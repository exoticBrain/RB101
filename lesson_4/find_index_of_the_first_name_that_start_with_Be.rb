def find_name(array)
  array.each_with_index do |name, index|
    return index if name.start_with?("Be")
  end
end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p find_name(flintstones)