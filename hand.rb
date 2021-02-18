# frozen_string_literal: true

class Hand
  attr_accessor :cards, :visible

  def initialize
    @cards = []
    @visible = false
  end

  def add_card_from_deck(deck)
    @cards << deck.cards.pop
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def value
    val = 0
    @cards.each do |card|
      val += if card.face.is_a?(Integer)
               card.face
             elsif card.face == 'Ace' && val + 11 > 21
               1
             elsif card.face == 'Ace'
               11
             else
               10
             end
    end
    val
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  def show_cards
    @visible = true
  end

  def print_string
    res = ''
    @cards.each do |card|
      res += ' ' + card.face.to_s + card.suit
    end
    res
  end
end
