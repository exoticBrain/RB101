str = "joe's favorite color is blue"

str[0].upcase
i = 0
loop do
  if str[i] == ' '
    str[i + 1].upcase
  end
end

p str