def remove_people(people)
  iteration_people = people

  iteration_people.each do |key, val|
    if val >= 100
      people.delete(key)
    end
  end

  people
end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p remove_people(ages)