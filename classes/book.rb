# book.rb
require_relative 'item'

class Book < Item
  attr_accessor :cover_state, :publisher
  attr_reader :can_be_archived

  def initialize(publish_date, cover_state, publisher)
    super(publish_date)
    @cover_state = cover_state
    @publisher = publisher
    @can_be_archived = can_be_archived?
  end

  def to_json(options = {})
    {
      id: @id,
      publish_date: @publish_date,
      cover_state: @cover_state,
      publisher: @publisher
    }.to_json(options)
  end

  private

  def can_be_archived?
    super || @cover_state.downcase == 'bad'
  end
end
