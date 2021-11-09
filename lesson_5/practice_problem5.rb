require 'pry-byebug'

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0
family_member = munsters.keys
count = 0
while count < family_member.size
  #binding.pry
  if munsters[family_member[count]]["gender"] == "male"
    total_age += munsters[family_member[count]]["age"]
  end
  count += 1
end

p total_age