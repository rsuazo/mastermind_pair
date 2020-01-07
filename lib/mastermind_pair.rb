class Game
  attr_accessor :secret_code, :colors, :converted_code, :round, :guess

  def initialize
    @colors = %w[r o y g b i v]
    @secret_code = @colors.sample(4)
    @round = 1
    @guess = ""
  end

  def get_guess
    puts "Guess the secret code\n\n\n"
    puts "your choices are:\n\n"
    puts "(r)ed (o)range (y)ellow (g)reen (b)lue (i)ndigo (v)iolet"
    loop do
      guess = gets.chomp.downcase
      if guess.length != 4
        p @secret_code
        puts "Invalid entry! Try again!"
      else
        puts "Good choice!"
        guess
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

  # def compare_guess(input)
  #   if
  #   end
  # end

  def play_round
    get_guess # produce a string of four characters
    compare_guess(guess) # compare the four characters from #get_guess against game.converted_code
    output_response # display progress of game
    round += 1
  end
end
