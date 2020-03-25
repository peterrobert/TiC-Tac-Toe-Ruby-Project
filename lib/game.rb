class Game

    def initialize

    end

    def valid_movement?(first_player, second_player, new_movement)
        begin
          is_integer = true if Integer(new_movement)
        rescue StandardError
          is_integer = false
        end
      
        if is_integer
          if new_movement.to_i >= 1 && new_movement.to_i <= 9
            return first_player.none?(new_movement) && second_player.none?(new_movement)
          end
        end
        false
      end
    end