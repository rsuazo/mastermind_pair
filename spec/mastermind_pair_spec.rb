require './lib/mastermind_pair.rb'

RSpec.describe Game do
  context '#output_progress' do
    it "does something for now" do
      arr1 = %w[+ _ _ _]
      game = Game.new
      expect(game.output_progress(arr1)).to be_an(Array)
    end
  end
end