require './board'
require './player'

class Game
  attr_accessor :code_creater, :guesser

  @@colors = %w[red green blue yellow brown orange black white]

  def initialize(code_creator, guesser, board)
    @code_creator = code_creator
    @guesser = guesser
    @board = board
    @current_turn = 1
    @result = []
    play
  end

  def play
    computer_creator_mode if computer?(@code_creator)
    human_creator_mode unless computer?(@code_creator)
  end

  def human_creator_mode
    puts "\n\tYou are the creator of the secret code"
    @board.print_instructions
    @code_creator.selection = choose_code
    until game_end?
      puts "\n\nCurrent turn: #{@current_turn}\n\n"
      @guesser.selection = computer_guesser
      @board.print_board
      puts "\nComputer guessing:\t #{@guesser.selection.join(' ')}\n"
      @result = @guesser.compare(@code_creator.selection)
      puts "\nresult is:\t\t #{@result.join(' ')}\n"
      puts 'Congratulations you got all expectations right ' if announce_winner
      @current_turn += 1
    end
  end

  def computer_creator_mode
    puts "\n\tYou are the guesser"
    @board.print_instructions
    @code_creator.selection = generate_code(4)
    until game_end?
      puts "\n\nCurrent turn: #{@current_turn}\n\n"
      @guesser.selection = choose_code
      @board.print_board
      @result = @guesser.compare(@code_creator.selection)
      puts "\nresult is:\t\t #{@result.join(' ')}\n"
      puts 'Congratulations you got all expectations right ' if announce_winner
      @current_turn += 1
    end
  end

  def computer_guesser
    arr = Array.new(4, 'no_color')
    if @current_turn == 1
      arr = generate_code(4)
    else
      @result.each_with_index do |element, index|
        arr[index] = @guesser.selection[index] if element == 'red'
        arr[index] = generate_code(1).first if element != 'red'
      end
    end
    arr
  end

  def computer?(player)
    true if player.kind == 'computer'
  end

  def failed?
    @current_turn == @@colors.length + 1
  end

  def announce_winner
    !@result.empty? && @result.all? { |e| e == 'red' }
  end

  def game_end?
    announce_winner || failed?
  end

  def generate_code(n)
    code = @@colors.sample(n)
    code
  end

  def choose_code
    code = []
    (0..3).each do |i|
