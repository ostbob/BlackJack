class Game
  def initialize()
    @deck = Deck.new
    @gamer = Player.new('Gamer', 100)
    @dealer = Player.new('Dealer', 100)

    2.times { @gamer.hand.add_card_from_deck(@deck) }
    2.times { @dealer.hand.add_card_from_deck(@deck) }
  end
end
