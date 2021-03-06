# rubocop: disable Metrics/CyclomaticComplexity
class Game
  attr_reader :switch_player
  attr_reader :who_won

  WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

  def initialize
    reset
  end

  def valid_movement?(first_player, second_player, new_movement)
    begin
      is_integer = true if Integer(new_movement)
    rescue StandardError
      is_integer = false
    end

    if is_integer
      if new_movement.to_i >= 1 && new_movement.to_i <= 9
        return first_player.none?(new_movement.to_i) && second_player.none?(new_movement.to_i)
      end
    end
    false
  end

  def finished?(first_player_movements, second_player_movements)
    if player_win?(first_player_movements)
      @who_won = 1
      return true
    elsif player_win?(second_player_movements)
      @who_won = 2
      return true
    elsif first_player_movements.length + second_player_movements.length == 9
      @who_won = 0
      return true
    else
      @who_won = -1
    end
    false
  end

  def player_win?(player_movements)
    return false unless player_movements.length >= 3

    WINNING_COMBINATIONS.each do |combination|
      return true if (combination - player_movements).empty?
    end

    false
  end

  def new_movement(player, movement)
    player.push(movement)
    @switch_player = !@switch_player

    player
  end

  def reset()
    @switch_player = false
    @who_won = -1
  end
end

# rubocop: enable Metrics/CyclomaticComplexity
