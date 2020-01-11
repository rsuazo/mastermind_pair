class Game
  attr_accessor :secret_code, :colors, :converted_code, :round, :guess, :board, :feedback, :board_object_instance

  def initialize
    @colors = %w[r o y g b i v]
    @secret_code = @colors.sample(4)
    @round = 1
    @guess = ""
    # this instance variable would become assigned the Board instance
    @board = []
    @feedback = []
    @board_object_instance = Board.new
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
        update_progress(guess)
        board.each_with_index do |row, i|
          print row, feedback[i], "\n"
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

  # def show_board
  #   board << guess.chars
  #   update_progress(guess)
  #   board.each_with_index do |row, i|
  #     print row, feedback[i], "\n"
  #   end
  # end

  def update_progress(str1 = nil)
    i = 0
    hints = []
    while i < str1.chars.length
      if secret_code.include?(str1.chars[i])
        if str1.chars[i] == secret_code[i]
          hints << "+"
        else
          hints << "_"
        end
      end
      i += 1
    end
    while hints.length != 4
      hints << " "
    end
    feedback << hints
  end

  def play_round
    while round < 10
      get_guess # produce a string of four characters
      # show_board # display progress of game
      @round += 1
    end
    # puts "Game over! The code was #{secret_code}"
    board_object_instance.game_over_reveal
    # this is how I refactored to solve the Encapsluation issue I was having
    print secret_code
  end
end

class Board
  
  def initialize
  end

  def game_over_reveal
    puts "Game over! The secret code was: "
  end


end
