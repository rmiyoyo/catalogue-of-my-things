# main.rb
require_relative 'Utils/book_handler'

# Entry point for the console app
class Main
  def initialize
    @book_handler = BookHandler.new
  end

  def menu_option
    puts 'Choose an option:'
    puts '1. List all books'
    puts '2. List all labels'
    puts '3. Add a book'
    puts '4. List all music albums'
    puts '5. List all genres'
    puts '6. Add a music album'
    puts '7. List all games'
    puts '8. List all authors'
    puts '9. Add a game'
    puts '10. Quit'
  end

  def start
    loop do
      menu_option

      choice = gets.chomp.to_i

      case choice
      when 1 then @book_handler.list_books
      when 2 then @book_handler.list_labels
      when 3 then @book_handler.add_book
      when 10 then @book_handler.quit
      else
        puts 'Invalid option. Please try again.'
      end
    end
  end
end

# Run the app
app = Main.new
app.start
