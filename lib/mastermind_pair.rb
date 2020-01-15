class Game
  attr_accessor :secret_code, :colors, :converted_code, :round, :guess, :board, :feedback, :board_object_instance

  def initialize
    @colors = %w[r o y g b i v]
    @secret_code = @colors.sample(4)
    @round = 1
    @guess = ""
    @board = []
    @feedback = []
    @board_object_instance = Board.new
  end

  def introduction
    puts "WELCOME TO MASTERMIND!\n\n"
    puts "Guess the secret code\n\n"
    puts "your choices are:\n\n"
    puts "(r)ed (o)range (y)ellow (g)reen (b)lue (i)ndigo (v)iolet"
  end

  def get_guess
    loop do
      guess = gets.chomp.downcase
      if guess.length != 4
        puts "Invalid entry; only 4 colors"
      elsif !guess.chars.all? { |x| colors.include?(x) }
        puts "Invalid entry; your options are"
        puts "(r)ed (o)range (y)ellow (g)reen (b)lue (i)ndigo (v)iolet"
      elsif guess.chars.uniq.length != 4
        puts "No duplicates"
      else
        puts "Valid Guess: This is now turn: #{round}\n\n"
        board << guess.chars
        break
      end
    end
    guess
  end

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
    feedback
  end

  def play_round
    while round < 10
      round == 1 ? introduction : board_object_instance.prompt_player
      get_guess
      @round += 1
      update_progress(guess)
      board.reverse.each_with_index do |row, i|
        print row, feedback[i], "\n"
      end
    end
    board_object_instance.game_over_reveal
    print secret_code
  end
end

class Board
  def initialize
  end

  def game_over_reveal
    puts "Game over! The secret code was: "
  end

  def prompt_player
    puts "your choices are:\n\n"
    puts "(r)ed (o)range (y)ellow (g)reen (b)lue (i)ndigo (v)iolet"
  end
end
