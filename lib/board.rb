class Board
  attr_accessor :snakes, :ladders
  
  # @@ for class variables

  Default_snakes = {
    17 => 4,
    24 => 16,
    32 => 30,
    34 => 12
  }

  Default_ladders = {
    2 => 15,
    5 => 7,
    9 => 27,
    18 => 29,
    25 => 35
  }
  
  def initialize(snakes = Default_snakes, ladders = Default_ladders)
    @snakes = snakes
    @ladders = ladders
  end
end

