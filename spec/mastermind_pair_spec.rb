require "./lib/mastermind_pair.rb"

RSpec.describe Game do
  context "#update_progress" do
    it "pushes an Array to @feedback" do
      game = Game.new
      game.guess = "rbyi"
      game.secret_code = "rbiv"
      game.update_progress(game.guess)
      expect(game.feedback[0]).to be_an(Array)
    end

    it "converts matching colors in the guess to '+' || '_' " do
      game = Game.new
      game.guess = "royg"
      game.secret_code = "rybi"
      game.update_progress(game.guess)
      expect(game.feedback[0]).to eq(['+', '_', ' ', ' '])
    end

    it "returns ['+', '+', ' ', ' '] if 2 colors are right color, right position" do
      game = Game.new
      game.secret_code = 'rbig'
      game.guess = 'royg'
      game.update_progress(game.guess)
      expect(game.feedback[0]).to eq(['+', '+', ' ', ' '])
    end

    it "returns ['+', '_', ' ', ' '] if 1 color is right color, right position and 1 is right color, wrong position" do
      game = Game.new
      game.secret_code = 'royg'
      game.guess = 'rbgi'
      game.update_progress(game.guess)
      expect(game.feedback[0]).to eq(['+', '_', ' ', ' '])
    end
  end
end
