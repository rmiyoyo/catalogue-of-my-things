require_relative '../classes/genre'

module GenreModule
  # Create a new music genre based on user input.
  def create_a_genre
    print 'Add a new music genre: '
    genre_name = gets.chomp.strip
    if genre_name.empty?
      puts "Invalid input. No genre has been created.\n\n"
    else
      @genres << Genre.new(genre_name)
      puts "\nNew genre created successfully!\n\n"
    end
  end

  # List all music genres, or display a message if none are found.
  def list_all_genres
    if @genres.empty?
      puts "\nNo music genres found.\n\n"
    else
      puts 'List of all genres:'
      display_genre_info
    end
  end

  # Display information about each music genre.
  def display_genre_info
    @genres.each_with_index do |genre_item_data, index|
      puts "(#{index + 1}) #{genre_item_data.name}"
    end
  end
end
