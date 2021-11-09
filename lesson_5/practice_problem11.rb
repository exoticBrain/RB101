arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# Multiples of three
# 3, 6, 9, 12, 15, 18, 21, 24, 27, 30.

new_array = arr.map do |sub_arr|
  sub_arr.select do |item|
    item % 3 == 0
  end
end

p new_array