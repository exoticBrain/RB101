arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_arr = arr.map do |sub_arr|
  sub_arr.sort do |first, second|
    second <=> first
  end
end

p new_arr