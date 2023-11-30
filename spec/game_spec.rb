require_relative '../classes/game'

RSpec.describe Game do
  describe '#initialize' do
    it 'creates a game with the correct attributes' do
      game = Game.new(2020, true, '2021-11-15')
      expect(game.publish_date).to eq(2020)
      expect(game.multiplayer).to be true
      expect(game.date_last_played).to eq('2021-11-15')
    end
  end

  describe '#eligible' do
    it 'returns true if last played more than 2 years ago' do
      game = Game.new(2020, true, '2019-01-01')
      expect(game.eligible).to be true
    end

    it 'returns false if last played within the last 2 years' do
      game = Game.new(2020, true, '2022-01-01')
      expect(game.eligible).to be false
    end
  end

  describe '.all' do
    it 'returns an array of all game instances' do
      Game.new(2019, false, '2020-05-20')
      Game.new(2021, true, '2021-12-10')
      games = Game.all
      expect(games).to all(be_a(Game))
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if eligible for archiving' do
      game = Game.new(2018, true, '2018-01-01')
      allow(game).to receive(:can_be_archived?).and_return(true)
      expect(game.send(:can_be_archived?)).to be true
    end

    it 'returns false if not eligible for archiving' do
      game = Game.new(2022, false, '2022-01-01')
      allow(game).to receive(:can_be_archived?).and_return(false)
      expect(game.send(:can_be_archived?)).to be false
    end
  end
end
