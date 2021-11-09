def add_up_age(ages)
  total_ages = 0
  ages.each do |_, age|
    total_ages += age
  end
  
  total_ages
end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p add_up_age(ages)