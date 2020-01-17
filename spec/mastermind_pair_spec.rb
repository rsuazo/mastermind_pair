require "./lib/mastermind_pair.rb"

RSpec.describe Game do
  context "#gather_feedback" do
    it "adds elements to @feedback" do
      game = Game.new
      game.secret_code = %w[r o y g]
      game.guess = "royg"
      game.gather_feedback(game.guess)
      expect(game.feedback).to eq([["+", "+", "+", "+"]])
    end
  end
  
  context "#win_game?" do
    it "identifies winning scenario" do
      game = Game.new
      game.feedback = [['+', '_', '_', ' '], ["+","+","+","+"]]
      game.win_game?(game.feedback)
      expect(game.winner).to eq(true)
      
    end  
  end
 
end
