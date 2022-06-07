class Card
  attr_reader :value, :up
  def initialize(value,up)
    @value = value
    @up = up
  end
  def display
    if @up
      return @value
    else
      return " "
    end
  end
  def hide
    @up = false
  end
  def reveal
    @up = true
  end
  def to_s
    @value.to_s
  end
  def ==(other_card)
    return false if other_card == nil
    @value == other_card.value
  end
end