require 'rspec'
require_relative '../classes/item'
require_relative '../classes/music_album'

describe MusicAlbum do
  describe 'Initialization' do
    it 'is a class' do
      expect(described_class).to be_a(Class)
    end

    it 'inherits from Item class' do
      expect(described_class.new(Time.now, true)).to be_an(Item)
    end

    it 'has a publish_date attribute' do
      album = described_class.new(Time.now, true)
      expect(album).to respond_to(:publish_date)
    end

    it 'has an on_spotify attribute' do
      album = described_class.new(Time.now, true)
      expect(album).to respond_to(:on_spotify)
    end
  end

  describe 'can_be_archived?' do
    let(:album) { described_class.new(Time.now - (11 * 365 * 24 * 60 * 60), true) }

    it 'returns true when publish date is older than 10 years and on Spotify' do
      expect(album.send(:can_be_archived?)).to be true
    end

    it 'returns false when not on Spotify' do
      album.instance_variable_set(:@on_spotify, false)
      expect(album.send(:can_be_archived?)).to be false
    end

    it 'returns false when publish date is not older than 10 years' do
      album.instance_variable_set(:@publish_date, Time.now - (5 * 365 * 24 * 60 * 60))
      expect(album.send(:can_be_archived?)).to be false
    end
  end
end
