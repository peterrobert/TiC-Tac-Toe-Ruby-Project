require_relative '../lib/game.rb'

RSpec.describe Game do
    describe "#valid_movement?" do
        let(:game) {Game.new}
      it "returns true if it recieves a number between 1 and 9 and this number must be unique in first player and second player movements" do

        expect(game.valid_movement?([],[],9)).to eql(true)

      end
    end
  end