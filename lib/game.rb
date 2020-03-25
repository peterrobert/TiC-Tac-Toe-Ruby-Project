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

      def finished?(first_player_movements, second_player_movements)
        return 1 if player_win?(first_player_movements)
        return 2 if player_win?(second_player_movements)
      
        if first_player_movements.length + second_player_movements.length == 9
          0
        else
          -1
        end
      end

    end