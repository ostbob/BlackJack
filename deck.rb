# frozen_string_literal: true

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    faces = *(2..10).to_a + %w[Jack Queen King Ace]
    suits = ['+', '<3', '^', '<>']
    faces.each do |face|
      suits.each do |suit|
        @cards << Card.new(face, suit)
      end
    end

    @cards.shuffle!
  end
end
