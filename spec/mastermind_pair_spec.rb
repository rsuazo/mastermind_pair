require './lib/mastermind_pair.rb'

RSpec.describe Game do
  context '#output_progress' do
    it "converts an Array to '+' or '_'" do
      arr1 = %w[r o y g]
      game = Game.new
      output = game.output_progress(arr1)
      output.each do |x|
        expect(x).to eq('+').or eq('_')
      end
    end
  end
end