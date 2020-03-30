# rubocop: disable Layout/LineLength

require_relative '../lib/game.rb'

RSpec.describe Game do
  describe '#valid_movement?' do
    let(:game) { Game.new }
    it 'returns true if it recieves a number between 1 and 9 and this number must be unique in first player and second player movements' do
      expect(game.valid_movement?([], [], 9)).to eql(true)
    end

    it 'returns true if it recieves a number between 1 and 9 and this number must be unique in first player and second player movements' do
      expect(game.valid_movement?([3], [5], 9)).to eql(true)
    end

    it 'returns true if it recieves a number between 1 and 9 and this number must be unique in first player and second player movements' do
      expect(game.valid_movement?([9], [1, 2], 9)).to eql(false)
    end

    it 'returns true if it recieves a number between 1 and 9 and this number must be unique in first player and second player movements' do
      expect(game.valid_movement?([], [], 10)).to eql(false)
    end

    it 'returns true if it recieves a number between 1 and 9 and this number must be unique in first player and second player movements' do
      expect(game.valid_movement?([9], [1, 2], 'd')).to eql(false)
    end
  end
end

# rubocop: enable Layout/LineLength
