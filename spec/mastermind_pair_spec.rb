require "./lib/mastermind_pair.rb"

RSpec.describe Game do  
  context "#win_game?" do
    it "identifies winning scenario" do
      game = Game.new
      game.board.feedback = [['+', '_', '_', ' '], ["+","+","+","+"]]
      game.win_game?(game.board.feedback)
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

  context '#introduction' do
    it 'does something' do
      game = Game.new
      game.introduction
      expect(game.game_flow).to be_falsey
    end
  end
 
end
