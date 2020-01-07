class Game
  attr_accessor :secret_code, :colors, :converted_code, :round, :guess, :board

  def initialize
    @colors = %w[r o y g b i v]
    @secret_code = @colors.sample(4)
    @round = 1
    @guess = ""
    @board = []
  end

  def get_guess
    puts "Guess the secret code\n\n\n"
    puts "your choices are:\n\n"
    puts "(r)ed (o)range (y)ellow (g)reen (b)lue (i)ndigo (v)iolet"
    loop do
      guess = gets.chomp.downcase
      if guess.length != 4
        p @secret_code
        puts "Invalid entry; only 4 colors"
      elsif !guess.chars.all? { |x| colors.include?(x) }
        puts "Invalid entry; your options are"
        puts "(r)ed (o)range (y)ellow (g)reen (b)lue (i)ndigo (v)iolet"
      elsif guess.chars.uniq.length != 4
        puts "No duplicates"
      else
        puts "Valid Guess: This is now turn: #{round}\n\n"
        board << guess.chars
        board.each do |row|
          print row, "\n"
        end
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
    while round < 10
      get_guess # produce a string of four characters
      #output_response # display progress of game
      @round += 1
    end
    puts "Game over"
  end
end
