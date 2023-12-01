require_relative 'classes/item'
require_relative 'app'
require_relative 'utils/book_handler'

# Entry point for the console app
class Main
  def initialize
    @app = App.new
    @book_handler = BookHandler.new
  end

  def menu_options
    {
      1 => 'List all books',
      2 => 'List all book labels',
      3 => 'List all game authors',
      4 => 'List all music albums',
      5 => 'List of music genres',
      6 => 'Show the game catalog',
      7 => 'Add a new game',
      8 => 'Add a new book',
      9 => 'Add a new music album',
      10 => 'Create a new music genre',
      11 => 'Quit (but we hope you stay!)'
    }
  end

  def menu_options_display
    puts "\nWelcome to the Catalog Menu!"
    options = menu_options
    options.each { |key, description| puts "#{key}. #{description}\n" }
    print "\nEnter a choice: "
  end

  def take_action(app, input)
    action_mapping = {
      3 => :list_authors_catalogue,
      4 => :list_all_music_albums,
      5 => :list_all_genres,
      6 => :show_games_catalogue,
      7 => :add_game,
      9 => :create_a_music_album,
      10 => :create_a_genre,
      11 => :quit
    }

    action = action_mapping[input]
    app.public_send(action) if app.respond_to?(action)
  end

  def take_action_for_book_handler(input)
    book_handler_actions = {
      1 => :list_books,
      2 => :list_labels,
      8 => :add_book
    }

    action = book_handler_actions[input]
    @book_handler.public_send(action) if @book_handler.respond_to?(action)
  end

  def start
    @app.load_data
    input = 0

    until input == menu_options.size
      menu_options_display
      input = gets.chomp.to_i

      unless menu_options.key?(input)
        puts 'Invalid option. Please choose a number from the menu!'
        next
      end

      if [1, 2, 8].include?(input)
        take_action_for_book_handler(input)
      else
        take_action(@app, input)
      end
    end
  end
end

# Run the app
app = Main.new
app.start
