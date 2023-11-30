require_relative '../classes/music_album'
require 'date'

module MusicAlbumModule
  # Creates a new music album based on user input for album date and Spotify choice.
  def create_a_music_album
    album_published_date = take_valid_album_date
    album_on_spotify = take_valid_spotify_choice

    generate_music_album(album_published_date, album_on_spotify)
  end

  # Lists all music albums, displaying their publication dates and Spotify status.
  def list_all_music_albums
    if @musicalbums.empty?
      puts "\nNo music albums found.\n\n"
    else
      puts 'List of all albums:'
      display_album_info
    end
  end

  # Displays information about each music album, including publication date and Spotify status.
  def display_album_info
    @musicalbums.each_with_index do |music_album, index|
      puts "(#{index + 1}) Published in: #{music_album.publish_date}. #{generated_answer(music_album.on_spotify)}"
    end
  end

  # Generates a user-friendly answer based on the Spotify status of an album.
  def generated_answer(on_spotify)
    on_spotify ? 'On Spotify.' : 'Not on Spotify.'
  end

  # Validates if a given date string is in the correct format.
  def valid_date?(date)
    Date.parse(date)
    true
  rescue ArgumentError
    false
  end

  private

  # Takes and validates user input for the published date of a music album.
  def take_valid_album_date
    print 'Write published album date in the format YYYY-MM-DD: '
    album_published_date = gets.chomp.strip

    until valid_date?(album_published_date)
      print 'Invalid date format. Write date in this format YYYY-MM-DD: '
      album_published_date = gets.chomp.strip
    end

    album_published_date
  end

  # Takes and validates user input for the Spotify choice of a music album.
  def take_valid_spotify_choice
    print 'Is this album on Spotify? (choose y/n): '
    album_on_spotify = gets.chomp.strip.downcase

    until %w[y n yes no].include?(album_on_spotify)
      print 'Invalid input. Is this album on Spotify? (choose y/n): '
      album_on_spotify = gets.chomp.strip.downcase
    end

    album_on_spotify
  end

  # Creates a music album based on the provided published date and Spotify choice.
  def generate_music_album(album_published_date, album_on_spotify)
    if %w[y yes].include?(album_on_spotify)
      @musicalbums << MusicAlbum.new(album_published_date, true)
      puts "\nMusic album created successfully!\n\n"
    elsif %w[n no].include?(album_on_spotify)
      @musicalbums << MusicAlbum.new(album_published_date, false)
      puts "\nMusic album created successfully!\n\n"
    else
      puts "\n Error: The music album was not created!\n\n"
    end
  end
end
