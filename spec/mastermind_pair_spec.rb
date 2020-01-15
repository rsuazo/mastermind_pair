require "./lib/mastermind_pair.rb"

RSpec.describe Game do
  context "#gather_feedback" do
    it "adds elements to @feedback" do
      game = Game.new
      game.secret_code = %w[r o y g]
      game.guess = "robv"
      game.gather_feedback(game.guess)
      expect(game.feedback.length).to be > 0 
    end

    it "records right color, wrong place as '_'" do
      game = Game.new
      game.secret_code = %w[r o y g]
      game.guess = "briv"
      game.gather_feedback(game.guess)
      expect(game.feedback).to be_falsey
    end
  end
end
