# label.rb
require_relative 'item'

class Label
  attr_accessor :id, :title, :color, :items

  def initialize(_id, title, color)
    @id = Random.rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_json(options = {})
    {
      id: @id,
      title: @title,
      color: @color,
      items: @items.map(&:to_json)
    }.to_json(options)
  end
end
