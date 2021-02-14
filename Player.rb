class Player
  attr_accessor :name, :hand, :bankroll

  def initialize(name, bankroll)
    @name = name
    @bankroll = bankroll
    @hand = Hand.new
  end
end
