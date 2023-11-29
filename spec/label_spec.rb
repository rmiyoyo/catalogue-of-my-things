require_relative '../classes/label'
require_relative '../classes/book'

RSpec.describe Label do
  describe '#initialize' do
    it 'creates a label with the correct attributes' do
      label = Label.new(1, 'Fiction', 'Blue')
      expect(label.id).to be_a(Integer)
      expect(label.title).to eq('Fiction')
      expect(label.color).to eq('Blue')
      expect(label.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the label' do
      label = Label.new(1, 'Fiction', 'Blue')
      book = Book.new(2022, 'good', 'John Doe')
      label.add_item(book)
      expect(label.items).to include(book)
      expect(book.label).to eq(label)
    end
  end
end
