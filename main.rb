# frozen_string_literal: true

require 'highline'

require_relative 'player'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'game'


class Main
  def start
    cli = HighLine.new
    loop do
      exit = false
      cli.choose do |menu|
        puts "\n\n\n"
        menu.prompt = 'Please choose your option:'
        menu.choice('test', text: 'Test text') {puts 'Test adadad'}
      end
      break if exit
    end

  end

  private

end
