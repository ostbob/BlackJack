class Player
  attr_accessor :name, :cards, :total_points, :bankroll

  def initialize(name, bankroll)
    @name = name
    @bankroll = bankroll
  end
end
