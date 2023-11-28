require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  # Initialize a new MusicAlbum instance with a publish date and Spotify availability.
  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  private

  # Check if the music album can be archived based on the superclass criteria and Spotify availability.
  def can_be_archived?
    super && @on_spotify
  end
end
