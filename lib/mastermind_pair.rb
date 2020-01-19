class Game
  attr_accessor :turn, :guess, :board, :winner, :game_flow

  def initialize
    # @colors = %w[r o y g b i v]
    # @secret_code = @colors.sample(4)
    @turn = 0
    @guess = ""
    @board = Board.new
    @game_flow = ""
    @winner = false
  end

  def introduction
    puts "\n\n"
    puts "WELCOME TO MASTERMIND!\n\n"
    puts "(i)nstructions"
    puts "(m)ake the code"
    puts "(b)reak the code"
    puts "\n\n"
    @game_flow = get_game_flow
  end

  def get_game_flow
    valid_input = %w[i m b]
    input = gets.chomp.downcase
    while !valid_input.include?(input)
      puts "please select: (i) or (m) or (b)"
      input = gets.chomp.downcase
    end
    board.prompt_player
    input  
  end

  def get_guess
    loop do
      input = gets.chomp.downcase
      if input.length != 4
        puts "Invalid entry; only 4 colors"
      elsif !input.chars.all? { |x| @board.colors.include?(x) }
        puts "Invalid entry; your options are"
        puts "(r)ed (o)range (y)ellow (g)reen (b)lue (i)ndigo (v)iolet"
      elsif input.chars.uniq.length != 4
        puts "No duplicates"
      else
        puts "Valid Guess. You have #{10 - turn} turns left\n\n"
        board.guesses << input.chars
        @guess = input
        break
      end
    end
  end

  def gather_feedback(str1 = "")
    i = 0
    hints = []
    while i < str1.chars.length
      if board.secret_code.include?(str1.chars[i])
        if str1.chars[i] == board.secret_code[i]
          hints << "+"
        else
          hints << "_"
        end
      end
      i += 1
    end
    hints.sort!
    while hints.length != 4
      hints << " "
    end
    board.feedback << hints
  end

  def win_game?(arr = nil)
    if arr[-1] == ["+", "+", "+", "+"]
      @winner = true
    else
      @winner = false
    end
  end

  def game_play
    # introduction
    while turn < 10
      @turn += 1
      get_guess
      gather_feedback(guess)
      display_the_board
      win_game?(board.feedback) ? break : nil
    end
    puts win_game?(board.feedback) ? "YOU WIN!" : nil
    board.game_over_reveal
    print board.secret_code
  end

  def instructions
    # write some instructions
    # they'll need to SIMPLY explain the game
    # they'll need to end with a either another call to #introduction
    # or they'll need to return a value for @game_flow
    # when done, see line 36
  end

  def make_the_code
    # this is the beginning of the #make_the_code function
  end

  def display_the_board
    board.guesses.reverse.each_with_index do |row, i|
      print row, board.feedback.reverse[i] , "\n"
    end
  end
end

class Board

  attr_accessor :colors, :secret_code, :guesses, :feedback

  def initialize
    @colors = %w[r o y g b i v]
    @secret_code = @colors.sample(4)
    @guesses = []
    @feedback = []
  end

  def game_over_reveal
    puts "Game over! The secret code was: "
  end

  def prompt_player
    puts "your choices are:"
    puts "(r)ed (o)range (y)ellow (g)reen (b)lue (i)ndigo (v)iolet"
    puts "\n\n"
  end
end
