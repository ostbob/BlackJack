# frozen_string_literal: true

class Player
  attr_accessor :name, :hand, :bankroll

  def initialize(name, bankroll)
    @name = name
    @bankroll = bankroll
    @hand = Hand.new
  end

  def bet(amount)
    @bankroll -= amount if @bankroll >= amount
  end
end
