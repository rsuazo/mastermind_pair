require_relative 'mastermind_pair'

game = Game.new
game.introduction
if game.game_flow == "b"
  game.game_play
elsif game.game_flow == "m"
  # game.make_the_code
else
  puts "displaying Instructions for the NOOB!"
end

