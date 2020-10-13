class Game 
    attr_accessor :human_player, :enemies
    
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
    
end
