# frozen_string_literal: true

require 'highline'

require_relative 'player'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'game'

class Main
  def start
    start_cli = HighLine.new
    loop do
      exit = false
      start_cli.choose do |menu|
        menu.choice('Start new game', text: 'Start new game') { start_new_game }
        menu.choice('Exit', text: 'Exit') { exit = true }
        menu.default = '...'
      end
      break if exit
    end
  end

  private

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def start_new_game
    puts 'Starting new game ...'
    game = Game.new
    game.start_first_round
    puts 'Gamer cards: ' + game.status[:gamer_cards]
    game_cli = HighLine.new
    loop do
      game_cli.choose do |menu|
        menu.prompt = 'Please choose your option!'
        menu.choice('Skip', text: 'Skip') { puts 'Gamer skipped.' }
        menu.choice('Take card', text: 'Take card') { game.gamer_take_card }
        menu.choice('Show your cards', text: 'Show your cards') { game.gamer_show_cards }
      end
      game.dealer_take_card if game.dealer_hand_value < 17
      puts 'Gamer cards: ' + game.status[:gamer_cards]
      break if game.show_cards?
    end
    puts 'Now cards are all visible ...'
    puts 'Gamer cards: ' + game.status[:gamer_cards]
    puts 'Dealer cards: ' + game.status[:dealer_cards]
    puts "Game result is: #{game.result}"
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end

Main.new.start
