require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



player1 = Player.new("arman")
player2 = Player.new("zilef")
player3 = HumanPlayer.new("Guts")


puts "Voici l'état de chaque joueur :"
puts player1.show_state
puts player2.show_state

puts "Passons à la phase d'attaque :"

player2.attacks(player1)
player1.attacks(player2)

#while continue a executer tant que la condition reste juste
while (player1.life_points >0 && player2.life_points >0) do
player2.attacks(player1)
#si l'un des deux meurt le jeu s'arrete
if (player1.life_points ==0)
    break
end
player1.attacks(player2)
if (player2.life_points ==0)
    break
end
end



