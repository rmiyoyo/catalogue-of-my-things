# book_service.rb
require 'json'

class BookService
  def self.save_books(books)
    File.write('books.json', JSON.pretty_generate(books))
  end

  # book handling to load books from the json file
  def self.load_books
    json_data = JSON.parse(File.read('books.json'), symbolize_names: true)
    json_data.map { |book_data| Book.new(*book_data.values_at(:publish_date, :cover_state, :publisher)) }
  rescue Errno::ENOENT
    []
  end

  def self.save_labels(labels)
    File.write('labels.json', JSON.pretty_generate(labels))
  end

  # label handling to load books from the json file
  def self.load_labels
    json_data = JSON.parse(File.read('labels.json'), symbolize_names: true)
    json_data.map do |label_data|
      Label.new(nil, label_data[:title], label_data[:color])
    end
  rescue Errno::ENOENT
    []
  end
end
