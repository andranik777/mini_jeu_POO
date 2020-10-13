class Player
attr_accessor :name, :life_points
def initialize(player_name)
    @name = player_name
    @life_points = 10
end
def show_state
    puts "#{@name} a #{@life_points} points de vie" 
end
def gets_damage(damage)
    @life_points -= damage.to_i
    if (life_points <=0)
        puts "Le joueur #{@name} a été tué"
        @life_points =0
    else
        puts "Le joueur #{@name} a #{@life_points} de vie" 
    end
end
def attacks(player)

puts "#{self.name} attaque #{player.name}"
hit = compute_damage
player.gets_damage(hit) #player2 reçoit des dommages
puts "#{@name} lui inflige #{hit} points de dommages"
end

def compute_damage
    return rand(1..6)
end

end

class HumanPlayer < Player
    attr_accessor :weapon_level
    
    def initialize(player_name)
    #super(name)
    @name =player_name
    @weapon_level = 1
    @life_points =100
    puts ">>#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end
    def compute_damage
        return rand(1..6) * @weapon_level
    end 
    def search_weapon
        arme = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{arme}"
        if (arme > @weapon_level)
            @weapon_level = arme
            puts "Tu as trouvé une arme superieur, prends là"
            else
            puts "L'arme n'est pas mieux que ton arme actuelle"
        end 
    end 
    def search_health_pack
        health = rand(1..6)
        case health
        when 1
            puts "Tu n'as rien trouvé..."
        when (2..5)
            @life_points +=50
            if (@life_points > 100)
                @life_points =100
            end 
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        when  6
            @life_points +=80
            if (@life_points > 100)
                @life_points =100
            end 
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end
    end
end

