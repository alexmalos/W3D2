class Board
  def initialize
    @grid = Array.new(4){Array.new(4)}
  end

  def populate
    alphabet = ("A".."Z").to_a.sample(8)
    cards = []
    alphabet += alphabet
    alphabet.each do |letter|
      cards << Card.new(letter,false)
    end
    cards.each do |card|
      row  = rand(0..3)
      col = rand(0..3)
      if @grid[row][col] == nil
        @grid[row][col] = card
      else
        redo
      end
    end
  end

  def render
    @grid.each do |row|
      new_row = row.map do |card|
        card.display
      end
      puts new_row.join(" ")
    end
  end

  def won?
    @grid.flatten.all? { |card| card.up }
  end

  def reveal(guessed_pos)
    self[guessed_pos].reveal
    return self[guessed_pos].value
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end
end