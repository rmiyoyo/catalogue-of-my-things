require 'rspec'
require_relative '../classes/genre'

describe Genre do
  describe 'Class Structure' do
    it 'is a class' do
      expect(described_class).to be_a(Class)
    end

    context 'Methods' do
      subject { described_class.new('Test Genre') }

      it 'has a name attribute' do
        expect(subject).to respond_to(:name)
      end

      it 'has an items attribute' do
        expect(subject).to respond_to(:items)
      end

      it 'has an id attribute' do
        expect(subject).to respond_to(:id)
      end

      it 'has an add_item method' do
        expect(subject).to respond_to(:add_item)
      end

      it 'has a private generate_uuid method' do
        expect(subject.private_methods).to include(:generate_uuid)
      end
    end
  end

  describe 'Instance Methods' do
    let(:genre) { Genre.new('Test Genre') }

    it 'initializes with a name' do
      expect(genre.name).to eq('Test Genre')
    end

    it 'initializes with an empty items collection' do
      expect(genre.items).to be_empty
    end

    it 'initializes with a generated UUID as id' do
      expect(genre.id).not_to be_nil
    end

    it 'adds an item to the items collection' do
      item = double('item')
      genre.add_item(item)

      expect(genre.items).to include(item)
    end

    it 'establishes a bidirectional relationship when adding an item' do
      item = double('item')
      allow(item).to receive(:respond_to?).with(:genre=).and_return(true)
      expect(item).to receive(:genre=).with(genre)

      genre.add_item(item)
    end
  end
end
