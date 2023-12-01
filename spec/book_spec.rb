require_relative '../classes/book'

RSpec.describe Book do
  describe '#initialize' do
    it 'creates a book with the correct attributes' do
      book = Book.new(2022, 'good', 'John Doe')
      expect(book.publish_date).to eq(2022)
      expect(book.cover_state).to eq('good')
      expect(book.publisher).to eq('John Doe')
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if cover state is "bad"' do
      book = Book.new(2022, 'bad', 'John Doe')
      expect(book.send(:can_be_archived?)).to be true
    end

    it 'returns true if 10 years have passed since publish date' do
      book = Book.new(2010, 'good', 'John Doe')
      allow(book).to receive(:can_be_archived?).and_return(true)
      expect(book.send(:can_be_archived?)).to be true
    end

    it 'returns false if neither condition is met' do
      book = Book.new(2022, 'good', 'John Doe')
      allow(book).to receive(:can_be_archived?).and_return(false)
      expect(book.send(:can_be_archived?)).to be false
    end
  end
end
