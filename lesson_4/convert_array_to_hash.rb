def convert_array_to_hash(array)
  converted_hash = {}

  array.each_with_index do |name, index|
    converted_hash[name] = index
  end

  converted_hash
end

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
p convert_array_to_hash(flintstones)