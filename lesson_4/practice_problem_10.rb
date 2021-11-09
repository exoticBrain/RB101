munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def age_group(group_list)
  keys = group_list.keys
  count = 0

  loop do
    current_key = keys[count]
    current_age = group_list.values[count].values.first

    if current_age.between?(0, 17)
      group_list[current_key]["age_group"] = "kid"
    elsif current_age.between?(18, 64)
      group_list[current_key]["age_group"] = "adult"
    else
      group_list[current_key]["age_group"] = "aged"
    end
    count += 1
    break if count >= keys.size
  end

  group_list
end

p age_group(munsters)