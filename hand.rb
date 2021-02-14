# frozen_string_literal: true

class Hand
  attr_accessor :cards

  def initialize()
    @cards = []
  end

  def add_card_from_deck(deck)
    @cards << deck.cards.pop
  end

  def value
    val = 0
    @cards.each do |card|
      if card.face.between?(2,10)
        val += card.
      elsif card.face = 'Ace' and val + 11 > 21
        val += 1
      elsif card.face = 'Ace'
        val += 11
      else
        val += 10
      end
    end
    val
  end
end
