class RandomCharacterGenerator
    attr_accessor :stats_array, :points_pool, :max_roll

    def initialize
        @stats_array = ["strength", "dexterity", "intelligence", "charisma"]
        @points_pool = 9
        @max_roll = 6
    end


    def new_character(name, player)
      Character.new(name: name, player: player).tap do |character|
        roll_stats(character, @stats_array, @points_pool, @max_roll)
        character.save!
      end
    end


    private

    def roll_stats(character, stats_array, points_pool, max_roll)
        stats_array.each do |stat|
          roll = rand(1..10)
          character[stat] = roll

          if roll > points_pool
            roll = points_pool
          end
          points_pool -= roll
        end
    end

end
