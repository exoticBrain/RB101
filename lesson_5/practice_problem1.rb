arr = ['10', '11', '9', '7', '8']

x = arr.sort do |first, second|
  second.to_i <=> first.to_i
end
p x
p arr