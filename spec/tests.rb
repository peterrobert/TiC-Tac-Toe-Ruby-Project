# rubocop: disable Layout/LineLength

require_relative '../lib/game.rb'

RSpec.describe Game do
  describe '#valid_movement?' do
    let(:game) { Game.new }
    it 'returns true if it recieves a number between 1 and 9 and this number must be unique in first player and second player movements' do
      expect(game.valid_movement?([], [], 9)).to eql(true)
    end

    it 'returns true if it recieves a number between 1 and 9 and this number must be unique in first player and second player movements' do
      expect(game.valid_movement?([], [], -1)).not_to eql(true)
    end

    it 'returns true if it recieves a number between 1 and 9 and this number must be unique in first player and second player movements' do
      expect(game.valid_movement?([3], [5], 9)).to eql(true)
    end

    it 'returns true if it recieves a number between 1 and 9 and this number must be unique in first player and second player movements' do
      expect(game.valid_movement?([3], [5], 3)).not_to eql(true)
    end

    it 'returns true if it recieves a number between 1 and 9 and this number must be unique in first player and second player movements' do
      expect(game.valid_movement?([9], [1, 2], 9)).to eql(false)
    end

    it 'returns true if it recieves a number between 1 and 9 and this number must be unique in first player and second player movements' do
      expect(game.valid_movement?([9], [1, 2], 1)).not_to eql(true)
    end

    it 'returns true if it recieves a number between 1 and 9 and this number must be unique in first player and second player movements' do
      expect(game.valid_movement?([], [], 10)).to eql(false)
    end

    it 'returns true if it recieves a number between 1 and 9 and this number must be unique in first player and second player movements' do
      expect(game.valid_movement?([], [], 0)).not_to eql(true)
    end

    it 'returns true if it recieves a number between 1 and 9 and this number must be unique in first player and second player movements' do
      expect(game.valid_movement?([9], [1, 2], 'd')).to eql(false)
    end

    it 'returns true if it recieves a number between 1 and 9 and this number must be unique in first player and second player movements' do
      expect(game.valid_movement?([9], [1, 2], 't')).not_to eql(true)
    end
  end

  describe '#player_win?' do
    let(:game) { Game.new }
    it 'returns TRUE if the passed array has a WINNING_COMBINATION' do
      expect(game.player_win?([])).to eql(false)
    end

    it 'returns TRUE if the passed array has a WINNING_COMBINATION' do
      expect(game.player_win?([])).not_to eql(true)
    end

    it 'returns TRUE if the passed array has a WINNING_COMBINATION' do
      expect(game.player_win?([1, 2, 3])).to eql(true)
    end

    it 'returns TRUE if the passed array has a WINNING_COMBINATION' do
      expect(game.player_win?([1, 2, 3])).not_to eql(false)
    end

    it 'returns TRUE if the passed array has a WINNING_COMBINATION' do
      expect(game.player_win?([1, 2, 4, 9])).to eql(false)
    end

    it 'returns TRUE if the passed array has a WINNING_COMBINATION' do
      expect(game.player_win?([1, 2, 4, 9])).not_to eql(true)
    end

    it 'returns TRUE if the passed array has a WINNING_COMBINATION' do
      expect(game.player_win?([2, 3, 4, 1])).to eql(true)
    end

    it 'returns TRUE if the passed array has a WINNING_COMBINATION' do
      expect(game.player_win?([2, 3, 4, 1])).not_to eql(false)
    end
  end

  describe '#finished?' do
    let(:game) { Game.new }
    it 'returns TRUE if there is a winner and FALSE if the game is not finished' do
      expect(game.finished?([], [])).to eql(false)
    end

    it 'returns TRUE if there is a winner and FALSE if the game is not finished' do
      expect(game.finished?([1, 2, 3], [4, 5])).to eql(true)
    end

    it 'returns TRUE if there is a winner and FALSE if the game is not finished' do
      expect(game.finished?([1, 2], [5, 4, 6])).to eql(true)
    end

    it 'returns TRUE if there is a winner and FALSE if the game is not finished' do
      expect(game.finished?([1, 2, 4], [8, 5, 9])).to eql(false)
    end

    it 'returns TRUE if there is a winner and FALSE if the game is not finished' do
      expect(game.finished?([1, 3, 5, 8, 9], [2, 4, 6, 7])).to eql(true)
    end
  end

  describe '#new_movement' do
    let(:game) { Game.new }
    it 'returns a new array with the new movement' do
      expect(game.new_movement([], 3)).to eql([3])
    end

    it 'returns a new array with the new movement' do
      expect(game.new_movement([1, 2], 3)).to eql([1, 2, 3])
    end

    it 'returns a new array with the new movement' do
      expect(game.new_movement([4, 9], 2)).to eql([4, 9, 2])
    end
  end
end

# rubocop: enable Layout/LineLength
