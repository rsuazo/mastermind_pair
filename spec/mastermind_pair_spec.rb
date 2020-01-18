require "./lib/mastermind_pair.rb"

RSpec.describe Game do  
  context "#win_game?" do
    it "identifies winning scenario" do
      game = Game.new
      game.feedback = [['+', '_', '_', ' '], ["+","+","+","+"]]
      game.win_game?(game.feedback)
      expect(game.winner).to eq(true)
    end  
  end

  context '#gather_feedback' do
    it "does something" do
      game = Game.new
      game.board.secret_code = %w[r o y g]
      expect(game.gather_feedback('oryb')).to eq([['+', '_', '_', ' ']])
    end
  end

  context '#get_guess' do
    it 'returns a value' do
      game = Game.new
      game.get_guess('royg')
      expect(game.guess).to be_falsey
    end
  end
 
end
