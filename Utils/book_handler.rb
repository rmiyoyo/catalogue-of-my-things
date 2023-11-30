# book_handler.rb
require_relative '../Classes/item'
require_relative '../Classes/book'
require_relative '../Classes/label'
require_relative 'book_service'

class BookHandler
  def initialize
    @books = BookService.load_books
    @labels = BookService.load_labels
  end

  def list_books
    puts 'List of Books:'
    @books.each do |book|
      puts("ID: #{book.id}, Publish Date: #{book.publish_date}, Archived: #{book.archived},
      Cover State: #{book.cover_state}, Publisher: #{book.publisher}")
    end
  end

  def list_labels
    puts 'List of Labels:'
    @labels.each do |label|
      puts "ID: #{label.id}, Title: #{label.title}, Color: #{label.color}"
    end
  end

  def add_book
    puts 'Enter book details:'
    get_user_input('Title:')
    publish_date = get_user_input('Publish Date YYYY-MM-DD:').to_i
    cover_state = get_user_input('Cover State [bad/good]:')
    publisher = get_user_input('Publisher:')

    book = create_book(publish_date, cover_state, publisher)
    label = create_label

    label.add_item(book)

    @books << book
    @labels << label

    BookService.save_books(@books)
    BookService.save_labels(@labels)

    puts 'Book added successfully!'
  end

  def quit
    puts 'Quitting the app. Goodbye!'
    exit
  end

  private

  def get_user_input(prompt)
    puts prompt
    gets.chomp
  end

  def create_book(publish_date, cover_state, publisher)
    Book.new(publish_date, cover_state, publisher)
  end

  def create_label
    puts 'Enter label details:'
    label_title = get_user_input('Title:')
    label_color = get_user_input('Color:')

    Label.new(nil, label_title, label_color)
  end
end
