class Game 
    attr_accessor :human_player, :enemies, :players_left, :enemies_in_sight
    
    def initialize(player_name)
    
        @human_player = HumanPlayer.new(player_name)
        bot_player =  Player.new("Josiane")
        bot_player2 = Player.new("José")
        bot_player3 =  Player.new("Marie")
        bot_player4 =  Player.new("Shiraishi")
        @enemies = [bot_player,bot_player2,bot_player3,bot_player4]

    end
    def kill_player(bot_player_name)
        @enemies.delete(bot_player_name)
    end
    def is_still_ongoing?
        
        if (@human_player.life_points >0 && (@enemies[0].life_points >0|| @enemies[1].life_points >0 || @enemies[2].life_points >0 || @enemies[3].life_points >0))
            return true
        else 
            return false
        end
    end
    def show_players
        print "1)" 
        @human_player.show_state
        print "2)"
        @enemies.each {|enemie| enemie.show_state}

    end
    def menu
        puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"
puts "Entrez votre nom"
input = gets.chomp.to_s

puts "Quelle action veux-tu effectuer ?"
puts "a - chercher une meilleure arme"
puts "s - chercher à se soigner \n\n"
puts "attaquer un joueur en vue :"
puts "0 - #{@enemies[0].show_state} attaquer #{@enemies[0].name}"
puts "1 - #{@enemies[1].show_state} attaquer #{@enemies[1].name}"
puts "2 - #{@enemies[2].show_state} attaquer #{@enemies[2].name}"
puts "3 - #{@enemies[3].show_state} attaquer #{@enemies[3].name}"


    end
    def menu_choice
        puts "---------------"
    @human_player.show_state
    @enemies.each{|m| m.show_state if m.life_points > 0}
    puts "---------------"
        player_choice =gets.chomp
        case player_choice
        when "a"
            @human_player.search_weapon
        when "s"
            @human_player.search_health_pack
        when "0" 
            @human_player.attacks(@enemies[0])
        
        when "1"
            @human_player.attacks(@enemies[1])
        
        when "2"
            @human_player.attacks(@enemies[2])
        
        when "3"
        @human_player.attacks(@enemies[3])
        end
        
    end
    
    def enemies_attack
        @enemies.each{|enemie,index| enemie.attacks(@human_player) if enemie.life_points >0; @enemies.kill_player(enemie[index]) if enemie.life_points < 0}  
    end 
    def end
        if (@human_player.life_points > 0)
            puts "BRAVO! TU AS GAGNÉ"
            else puts "GAME OVER"
            end
    end 
end
