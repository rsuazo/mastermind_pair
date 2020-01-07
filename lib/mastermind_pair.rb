class Game
  attr_accessor :secret_code, :colors, :converted_code, :round, :guess
  
  def initialize
    @colors = ["red", "blue", "green", "yellow", "black", "white", "indigo"]
    @secret_code = @colors.sample(4)
    @converted_code = @secret_code.map {|element| element[0]}
    @round = 1
    @guess = ''
  end

  def get_guess
    puts "Guess the secret code"
     loop do
      input = gets.chomp.downcase
      if input.length != 4
        puts @secret_code
        puts "Invalid entry! Try again!"
      else
        puts "Good choice!"
        @guess = input
        break
      end

      # if guess == @converted_code.join
      #   puts "You won!"
      #   break
      # else
      #   puts "Try again!"
      # end
    end
    guess
  end
  
  def compare_guess(input)
    if 
    end
  end

  def play_round
    get_guess # produce a string of four characters
    compare_guess(guess) # compare the four characters from #get_guess against game.converted_code
    output_response # display progress of game
    round += 1
  end

end



game = Game.new
puts game.converted_code
game.get_guess