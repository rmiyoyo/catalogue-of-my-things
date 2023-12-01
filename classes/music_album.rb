require 'date'
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
    @on_spotify && years_since_publish_date > 10
  end

  def years_since_publish_date
    Date.today.year - @publish_date.year
  end
end
