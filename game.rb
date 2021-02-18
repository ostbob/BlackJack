# frozen_string_literal: true

class Game
  def initialize
    @deck = Deck.new
    @gamer = Player.new('Gamer', 100)
    @dealer = Player.new('Dealer', 100)
    @bankroll = 0
    @bet_amt = 10
  end

  def start_first_round
    2.times { @gamer.hand.add_card_from_deck(@deck) }
    2.times { @dealer.hand.add_card_from_deck(@deck) }
    return unless @gamer.bankroll >= @bet_amt && @dealer.bankroll >= @bet_amt

    @gamer.bet(@bet_amt)
    @dealer.bet(@bet_amt)
    @bankroll += 2 * @bet_amt
  end

  def status
    {
      gamer_cards: @gamer.hand.print_string,
      dealer_cards: @dealer.hand.print_string,
      bankroll: @bankroll
    }
  end

  def gamer_take_card
    @gamer.hand.add_card_from_deck(@deck)
  end

  def gamer_show_cards
    @gamer.hand.show_cards
  end

  def dealer_hand_value
    @dealer.hand.value
  end

  def dealer_take_card
    @dealer.hand.add_card_from_deck(@deck)
  end

  def show_cards?
    @gamer.hand.visible || @gamer.hand.cards.count == 3 && @dealer.hand.cards.count == 3
  end

  # rubocop:disable Metrics/AbcSize
  def result
    if @dealer.hand.value > 21 || @gamer.hand.value > @dealer.hand.value && @gamer.hand.value <= 21
      @gamer.name + ' is winner.'
    elsif @dealer.hand.value == @gamer.hand.value
      'draw.'
    else
      @dealer.name + ' is winner.'
    end
  end
  # rubocop:enable Metrics/AbcSize
end
