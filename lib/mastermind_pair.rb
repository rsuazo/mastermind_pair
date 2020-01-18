class Game
  attr_accessor :secret_code, :colors, :converted_code, :round, :guess, :board, :feedback, :board_object_instance, :winner, :game_flow

  def initialize
    @colors = %w[r o y g b i v]
    @secret_code = @colors.sample(4)
    @round = 1
    @guess = ""
    @board = []
    @feedback = []
    @board_object_instance = Board.new
    @game_flow = ''
    @winner = false
  end

  def introduction
    valid_input = %w[i m b]
    puts "\n\n"
    puts "WELCOME TO MASTERMIND!\n\n"
    puts "(i)nstructions"
    puts "(m)ake the code"
    puts "(b)reak the code"

    # puts "Guess the secret code\n\n"
    # puts "your choices are:\n\n"
    # puts "(r)ed (o)range (y)ellow (g)reen (b)lue (i)ndigo (v)iolet"
    puts "\n\n"
    game_flow = gets.chomp.downcase
    while !valid_input.include?(game_flow)
      puts "please select: (i) or (m) or (b)"
      game_flow = gets.chomp.downcase
    end
    game_flow
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
        gather_feedback(guess)
        break
      end
    end
  end

  def gather_feedback(str1 = '')
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
  
  def win_game?(arr = nil)
    if arr[-1] == ["+","+","+","+"]
      @winner = true
    else
      @winner = false
    end
  end

  def game_play
    case introduction
    when "i"
      puts "displaying instructions"
    when "m"
      puts "you make the code"
    when "b"
      puts "you break the code"
    end
    while round < 10
      round == 1 ? introduction : board_object_instance.prompt_player
      get_guess
      if win_game?(@feedback) == true
        break
      end
      @round += 1
      board.reverse.each_with_index do |row, i|
        print row, feedback.reverse[i], "\n"
      end
    end
    puts win_game?(feedback) ? 'you win!' : nil
    board_object_instance.game_over_reveal
    print secret_code
  end
  
  def instructions
    # write some instructions
    # they'll need to SIMPLY explain the game
    # they'll need to end with a either another call to #introduction
    # or they'll need to return a value for @game_flow
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
