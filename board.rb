class Board
  attr_reader :picked_colors
  def initialize
    @picked_colors = Array.new(4, 'no_color')
  end

  def print_instructions
    puts "\nHere is the game instructions: \n"
    puts "\nThe secret code consists of four colors\n"
    puts "\nIf you are the secret creator you have to choose 4 colors\n"
    puts "\nIf you are the guesser you have to guess 4 colors each turn\n"
    puts "\nAftrer each turn you will get result Colors: \n"
    puts "\nRed means picked color is part of the secret code and is in the right position"
    puts "\nWhite means picked color is part of the secret code but is not in the right position"
    puts "\nno_color means picked color is not part of the secret code\n"
    puts "\nChoose 4 numbers from the list each number in a row\n"
    puts "\n1: red,    2: green, 3:blue",
         '4: yellow, 5: brown, 6: orange',
         "7: black,  8: white\n"
  end

  def print_board
    puts "\npicked colors are:\t #{picked_colors.join(' ')}\n"
  end

  def put_color(color, position)
    @picked_colors[position] = color
  end
end
