# label.rb
require_relative 'item'

class Label
  attr_accessor :id, :title, :color, :items

  def initialize(_id, title, color)
    @id = Random.rand(1...1000)
    @title = title
    @color = color
    @item = []
  end

  def add_item(item)
    @items << item
    item.set.label(self)
  end
end
