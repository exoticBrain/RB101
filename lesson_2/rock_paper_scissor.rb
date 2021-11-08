def prompt(msg)
  Kernel.puts("==> #{msg}")
end

def load_program(stuff, length)
  length.times do
    Kernel.print(stuff)
    sleep(0.03)
  end
end

def two_new_lines
  Kernel.puts("\n\n")
end

def take_input
  Kernel.print(">> ")
  Kernel.gets().chomp()
end

KEYS = [:r, :s, :p]
game = {
  r: 1,
  p: -1,
  s: 0
}

game_result = {
  name: '',
  r: "Rock",
  p: "Paper",
  s: "Scissor"
}

system("clear")
load_program("*", 63)
Kernel.puts("\n\t\t\tRock Paper Scissor")
load_program("*", 63)
two_new_lines()

prompt("What's your name!")
game_result[:name] = take_input().capitalize()

prompt("You can enter your choices")
loop do
  sleep(1.3)
  system("clear")
  prompt("Choose R : Rock || P : Paper || S : Scissor")
  player = take_input().downcase().to_sym()
  computer = KEYS.sample # .shuffle().first()
  unless KEYS.include?(player)
    prompt("Invalid input!")
    next
  end

  diff_choices = game[player] - game[computer]
  two_new_lines()
  prompt("Let's see how wins")
  load_program(">", 55)
  two_new_lines()

  case diff_choices
  when 0
    prompt("It looks like it's equal")
    sleep(1)
    next
  when 1
    prompt("Great! #{game_result[:name]}! you WON! \"I choosed #{game_result[computer]}\"")
  when -1
    prompt("Guess who wins!")
    sleep(2)
    prompt("Fool!! I get You hahaha \"I choosed #{game_result[computer]}\"")
  when 2
    prompt("You wanna win!! hahaha \"I choosed #{game_result[computer]}\"")
  else
    prompt("OKaay! #{game_result[:name]}! you WON! \"I choosed #{game_result[computer]}\"")
  end

  two_new_lines()
  prompt("Would you like to play again? Press \"Y\"")
  replay = take_input().downcase()
  break unless replay == "y"
end

load_program("*", 45)
Kernel.puts("\n\t\tThank you #{game_result[:name]}")
load_program("*", 45)
two_new_lines()
sleep(2)
system("clear")
