require_relative '../classes/author'
require_relative '../classes/game'

RSpec.describe Author do
  describe '#initialize' do
    it 'creates an author with the correct attributes' do
      author = Author.new('John', 'Doe')
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
      expect(author.items).to be_empty
    end
  end

  describe '#add_items' do
    it 'adds an item to the author\'s items' do
      author = Author.new('Jane', 'Smith')
      game = Game.new(2020, true, '2021-01-01')
      author.add_items(game)
      expect(author.items).to include(game)
      expect(game.author).to eq(author)
    end
  end

  describe '.all' do
    it 'returns an array of all author instances' do
      Author.new('John', 'Doe')
      Author.new('Jane', 'Smith')
      authors = Author.all
      expect(authors).to all(be_a(Author))
    end
  end
end
