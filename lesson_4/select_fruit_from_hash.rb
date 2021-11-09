produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce_list)
  count = 0
  selected_fruit = {}
  produce_keys = produce_list.keys

  loop do
    break if count == produce_keys.size
    
    current_key = produce_keys[count]
    current_value = produce_list[current_key]

    if current_value == "Fruit"
      selected_fruit[produce_keys[count]] = current_value
    end

    count += 1
  end

  selected_fruit
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}