# rubocop: disable Metrics/CyclomaticComplexity
# rubocop: disable Metrics/PerceivedComplexity
class Board
  def print(first_player, second_player)
    board = ''
    (0..8).each do |i|
      board += if first_player.any?(i + 1)
                 ((i + 1) % 3).positive? ? 'X | ' : 'X'
               elsif second_player.any?(i + 1)
                 ((i + 1) % 3).positive? ? 'O | ' : 'O'
               else
                 ((i + 1) % 3).positive? ? '  | ' : ' '
               end
      board += "\n—————————\n" if ((i + 1) % 3).zero? && i < 8
    end
    puts board
  end
end

# rubocop: enable Metrics/CyclomaticComplexity
# rubocop: enable Metrics/PerceivedComplexity
