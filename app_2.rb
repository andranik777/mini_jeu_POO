require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"
puts "Entrez votre nom"
input = gets.chomp.to_s
player_1 = HumanPlayer.new(input)
bot_player = Player.new("Josiane")
bot_player2 = Player.new("José")

enemies = [bot_player,bot_player2]

    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner \n\n"
    puts "attaquer un joueur en vue :"
    puts  "0 - #{bot_player.show_state} attaquer #{bot_player.name}"
    puts "1 - #{bot_player2.show_state} attaquer #{bot_player2.name}"

while (player_1.life_points > 0 && (bot_player.life_points>0 || bot_player2.life_points >0)) do
    puts "---------------"
    player_1.show_state
    bot_player.show_state
    bot_player2.show_state
    result =gets.chomp
    puts "---------------"
    case result
    when "a"
        player_1.search_weapon
    when "s"
        player_1.search_health_pack
    when "0" 
        player_1.attacks(bot_player)

    when "1"
        player_1.attacks(bot_player2)
    end
    enemies.each{|m| m.attacks(player_1) if m.life_points >0}
    
    #binding.pry
    
end 
if (player_1.life_points > 0)
puts "BRAVO! TU AS GAGNÉ"
else puts "GAME OVER"
end