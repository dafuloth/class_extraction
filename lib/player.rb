class Player
  attr_accessor :name, :position

  def initialize(name, position = 1)
    @name = name
    @position = position
  end

  def to_s
    @name
  end
end