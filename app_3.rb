require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


my_game = Game.new("Wolverine")
my_game.menu
while (my_game.is_still_ongoing?) do
my_game.menu_choice
my_game.enemies_attack
end 
my_game.end
