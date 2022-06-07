require_relative "card"
require_relative "board"

class Game
  def initialize
    @board = Board.new
    @previous_guess = nil
  end
  def prompt
    puts "please enter the position of the card you like to flip"
    gets.chomp.split.map{|ele| ele.to_i}
  end
  def make_guess(guessed_pos)
    @board.reveal(guessed_pos)
    if @previous_guess == nil
      @previous_guess = guessed_pos
    else
      
      @board.render
      unless @board[guessed_pos] == @board[@previous_guess]
        sleep(3)
        @board[guessed_pos].hide
        @board[@previous_guess].hide
      end
      @previous_guess = nil
    end
  end
  def play
    @board.populate
    until @board.won?
      system("clear")
      @board.render
      make_guess(self.prompt)
    end
  end
end