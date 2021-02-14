class Hand
  attr_accessor :cards

  def initialize()
    @cards = []
  end

  def add_card_from_deck(deck)
    @cards << deck.cards.pop
  end
end
