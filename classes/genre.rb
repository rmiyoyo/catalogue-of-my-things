require 'securerandom'
require_relative 'item'

class Genre
  attr_accessor :name, :items
  attr_reader :id

  # Initialize a new Genre instance with a unique ID and an empty collection of items.
  def initialize(name)
    @id = generate_uuid
    @name = name
    @items = []
  end

  # Add an item to the genre's collection, establishing a bidirectional relationship.
  def add_item(item)
    @items << item unless @items.include?(item)
    item.genre = self if item.respond_to?(:genre=)
  end

  private

  # Generate a unique UUID to be used as the genre's identifier.
  def generate_uuid
    SecureRandom.uuid
  end
end
