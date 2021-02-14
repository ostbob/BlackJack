# frozen_string_literal: true

class Game
  def initialize()
    @deck = Deck.new
    @gamer = Player.new('Gamer', 100)
    @dealer = Player.new('Dealer', 100)
    @bankroll = 0
    @bet_amt = 10
  end

  def first_round
    2.times { @gamer.hand.add_card_from_deck(@deck) }
    2.times { @dealer.hand.add_card_from_deck(@deck) }
    if @gamer.bankroll >= @bet_amt && @dealer.bankroll >= @bet_amt
      @gamer.bet(@bet_amt)
      @dealer.bet(@bet_amt)
      @bankroll += 2*@bet_amt
    end
  end

  def status
    {
      :gamer_cards => @gamer.hand.cards,
      :dealer_cards => @dealer.hand.cards
    }
  end
end
