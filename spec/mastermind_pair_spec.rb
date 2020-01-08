require './lib/mastermind_pair.rb'

RSpec.describe Game do
  context '#update_progress' do
    it "converts a String to Array of only '+' or '_'" do
      str1 = "royg"
      game = Game.new
      expect(game.update_progress(str1).length).to eq(4)
    end
  end
end